import 'package:flutter/foundation.dart';
import 'package:city_drive/src/core/data/session_repository.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/feature/app/logic/admin_updates_polling_service.dart';
import 'package:city_drive/src/feature/app/logic/demo_local_notification_service.dart';
import 'package:city_drive/src/feature/auth/data/auth_repository.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/search/model/mark_engagement_dto.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

class RoadProblemsProvider extends ChangeNotifier {
  RoadProblemsProvider({
    required IRoadProblemRepository repository,
    required IAuthRepository authRepository,
    required ISessionRepository sessionRepository,
  })  : _repository = repository,
        _auth = authRepository,
        _session = sessionRepository;

  final IRoadProblemRepository _repository;
  final IAuthRepository _auth;
  final ISessionRepository _session;
  List<RoadProblemDTO> _problems = [];
  bool _loading = false;
  String? _loadError;

  List<RoadProblemDTO> get problems => _problems;
  bool get isLoading => _loading;
  String? get loadError => _loadError;

  bool get _isController =>
      _session.currentRole == UserRole.controller;

  Future<void> load() async {
    if (!_auth.isAuthenticated) {
      _problems = [];
      _loadError = null;
      notifyListeners();
      return;
    }

    _loading = true;
    _loadError = null;
    notifyListeners();
    try {
      await _refreshFromApi();
    } catch (e) {
      _loadError = e.toString();
      debugPrint('RoadProblemsProvider.load error: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  /// Фоновое обновление при опросе API (без индикатора загрузки).
  Future<void> refreshSilently() async {
    if (!_auth.isAuthenticated) return;
    try {
      await _refreshFromApi();
      notifyListeners();
    } catch (e) {
      debugPrint('RoadProblemsProvider.refreshSilently error: $e');
    }
  }

  Future<void> _refreshFromApi() async {
    if (_isController) {
      // Controller data comes from GET /controller/dashboard (see ControllerDashboardCubit).
      return;
    }
    await _repository.refresh();
    await _repository.refreshMine();
    _problems = _repository.getAll();
  }

  /// «Мои отметки» — `GET /api/marks/mine`.
  List<RoadProblemDTO> problemsForUser(int userId, {String? authorName}) {
    final mine = _repository.getMine();
    if (mine.isNotEmpty) return mine;
    return _repository.getByAuthorId(userId, authorName: authorName);
  }

  List<RoadProblemDTO> mineForController() {
    final userId = _auth.user?.id;
    if (userId == null) return [];
    final dedicated = _repository.getMineForController();
    if (dedicated.isNotEmpty) return dedicated;
    return _repository.getAssignedToController(userId);
  }

  List<RoadProblemDTO> pendingForController() {
    if (_isController) {
      return _repository.getPendingForController();
    }
    return _problems
        .where((p) => p.status == 'new' || p.status == 'pending')
        .toList();
  }

  /// Sends a report with status `new`. Refreshes `GET /api/marks/mine` so the
  /// mark appears on the map as «На проверке» until admin accepts it.
  Future<RoadProblemDTO> submitReport({
    required RoadProblemDTO problem,
    String? localImagePath,
  }) async {
    final saved = await _repository.add(
      problem,
      localImagePath: localImagePath,
    );
    AdminUpdatesPollingService.instance.trackSubmittedMark(saved.id);
    await DemoLocalNotificationService.instance.showMarkSubmittedNotification();
    _problems = _repository.getAll();
    notifyListeners();
    debugPrint('Заявка отправлена (ожидает проверки): ${saved.id}');
    return saved;
  }

  Future<void> addProblem(
    RoadProblemDTO problem, {
    String? localImagePath,
  }) async {
    await submitReport(problem: problem, localImagePath: localImagePath);
    await load();
  }

  Future<void> removeProblem(int id) async {
    await _repository.delete(id);
    _problems = _repository.getAll();
    notifyListeners();
  }

  Future<void> updateProblem(RoadProblemDTO updatedProblem) async {
    await _repository.update(updatedProblem);
    _problems = _repository.getAll();
    notifyListeners();
  }

  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  }) async {
    final updated = await _repository.updateStatus(
      id: id,
      status: status,
      assignedControllerId: assignedControllerId,
      comment: comment,
    );
    if (!_isController) {
      await _repository.refresh();
      await _repository.refreshMine();
    }
    _problems = _repository.getAll();
    notifyListeners();
    return updated;
  }

  RoadProblemDTO? getProblemById(int id) => _repository.getById(id);

  Future<RoadProblemDTO?> refreshMark(int id) async {
    try {
      final mark = await _repository.fetchMarkById(id);
      _problems = _repository.getAll();
      notifyListeners();
      return mark;
    } catch (e) {
      debugPrint('RoadProblemsProvider.refreshMark error: $e');
      return getProblemById(id);
    }
  }

  Future<MarkLikeResult> toggleLike(int markId) async {
    final result = await _repository.toggleLike(markId);
    _problems = _repository.getAll();
    notifyListeners();
    return result;
  }

  Future<List<Comment>> fetchComments(int markId) async {
    final page = await _repository.fetchComments(markId);
    return page.content.map((c) => c.toComment()).toList();
  }

  Future<Comment> addComment(int markId, String text) async {
    final created = await _repository.addComment(markId, text.trim());
    _problems = _repository.getAll();
    notifyListeners();
    return created.toComment();
  }
}
