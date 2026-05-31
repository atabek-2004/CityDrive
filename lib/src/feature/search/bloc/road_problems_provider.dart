import 'package:flutter/foundation.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

class RoadProblemsProvider extends ChangeNotifier {
  RoadProblemsProvider(this._repository) {
    load();
  }

  final IRoadProblemRepository _repository;
  List<RoadProblemDTO> _problems = [];

  List<RoadProblemDTO> get problems => _problems;

  void load() {
    _problems = _repository.getAll();
    notifyListeners();
  }

  List<RoadProblemDTO> problemsForUser(int userId, {String? authorName}) =>
      _repository.getByAuthorId(userId, authorName: authorName);

  List<RoadProblemDTO> pendingForController() =>
      _repository.getPendingForController();

  Future<void> addProblem(RoadProblemDTO problem) async {
    final saved = await _repository.add(problem);
    _problems = _repository.getAll();
    notifyListeners();
    debugPrint('Добавлена отметка: ${saved.title} — ${saved.address}');
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

  Future<void> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
  }) async {
    await _repository.updateStatus(
      id: id,
      status: status,
      assignedControllerId: assignedControllerId,
    );
    _problems = _repository.getAll();
    notifyListeners();
  }

  RoadProblemDTO? getProblemById(int id) => _repository.getById(id);
}
