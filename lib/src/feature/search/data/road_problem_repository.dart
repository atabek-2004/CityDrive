import 'package:city_drive/src/core/local_storage/mappers/road_problem_mapper.dart';
import 'package:city_drive/src/core/local_storage/models/road_problem_entity.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/data/road_problem_local_ds.dart';
import 'package:city_drive/src/feature/search/model/mark_engagement_dto.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

abstract interface class IRoadProblemRepository {
  /// Reload from API or local store.
  Future<void> refresh();

  /// Pending marks for controller (`GET /api/marks/pending`).
  Future<void> refreshPending({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  });

  /// Controller's assigned marks — prefer `GET /controller/marks/mine`.
  Future<void> refreshMineForController({int? controllerUserId});

  /// Populated from `GET /controller/dashboard` → `my_marks`.
  void cacheMineForController(List<RoadProblemDTO> marks);

  /// Populated from `GET /controller/dashboard` → `pending_marks`.
  void cachePendingForController(List<RoadProblemDTO> marks);

  List<RoadProblemDTO> getMineForController();

  /// Current user's marks (`GET /api/marks/mine`).
  Future<void> refreshMine();

  /// All marks of the current user (every status).
  List<RoadProblemDTO> getMine();

  List<RoadProblemDTO> getAll();
  List<RoadProblemDTO> getByAuthorId(int authorUserId, {String? authorName});
  List<RoadProblemDTO> getPendingForController();
  List<RoadProblemDTO> getAssignedToController(int controllerId);
  RoadProblemDTO? getById(int id);
  Future<RoadProblemDTO> add(
    RoadProblemDTO problem, {
    String? localImagePath,
  });
  Future<RoadProblemDTO> update(RoadProblemDTO problem);
  Future<void> delete(int id);
  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  });

  Future<RoadProblemDTO> fetchMarkById(int id);

  Future<MarkLikeResult> toggleLike(int markId);

  Future<MarkCommentsPage> fetchComments(
    int markId, {
    int page = 0,
    int size = 20,
  });

  Future<MarkCommentDTO> addComment(int markId, String text);
}

class RoadProblemRepository implements IRoadProblemRepository {
  RoadProblemRepository(this._localDS);

  final RoadProblemLocalDataSource _localDS;

  @override
  Future<void> refresh() async {}

  @override
  Future<void> refreshPending({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {}

  @override
  Future<void> refreshMineForController({int? controllerUserId}) async {}

  @override
  void cacheMineForController(List<RoadProblemDTO> marks) {}

  @override
  void cachePendingForController(List<RoadProblemDTO> marks) {}

  @override
  Future<void> refreshMine() async {}

  @override
  List<RoadProblemDTO> getMine() => [];

  @override
  List<RoadProblemDTO> getMineForController() => [];

  @override
  List<RoadProblemDTO> getAll() =>
      _localDS.getAll().map(RoadProblemMapper.toDto).toList();

  @override
  List<RoadProblemDTO> getByAuthorId(
    int authorUserId, {
    String? authorName,
  }) =>
      _localDS
          .getAll()
          .where(
            (p) =>
                p.authorUserId == authorUserId ||
                (p.authorUserId == 0 &&
                    authorName != null &&
                    p.author == authorName),
          )
          .map(RoadProblemMapper.toDto)
          .toList();

  @override
  List<RoadProblemDTO> getPendingForController() => _localDS
      .getAll()
      .where(
        (p) =>
            p.status == ReportStatus.newReport ||
            p.status == ReportStatus.pending,
      )
      .map(RoadProblemMapper.toDto)
      .toList();

  @override
  List<RoadProblemDTO> getAssignedToController(int controllerId) => _localDS
      .getAll()
      .where(
        (p) =>
            p.assignedControllerId == controllerId &&
            (p.status == ReportStatus.confirmed ||
                p.status == ReportStatus.inProgress ||
                p.status == ReportStatus.fixed),
      )
      .map(RoadProblemMapper.toDto)
      .toList();

  @override
  RoadProblemDTO? getById(int id) {
    final entity = _localDS.getById(id);
    return entity == null ? null : RoadProblemMapper.toDto(entity);
  }

  @override
  Future<RoadProblemDTO> add(
    RoadProblemDTO problem, {
    String? localImagePath,
  }) async {
    final id = problem.id == 0 ? _localDS.nextId() : problem.id;
    final entity = RoadProblemMapper.fromDto(problem).copyWith(
      id: id,
      status: problem.status ?? ReportStatus.newReport,
    );
    await _localDS.save(entity);
    return RoadProblemMapper.toDto(entity);
  }

  @override
  Future<RoadProblemDTO> update(RoadProblemDTO problem) async {
    final entity = RoadProblemMapper.fromDto(problem);
    await _localDS.save(entity);
    return RoadProblemMapper.toDto(entity);
  }

  @override
  Future<void> delete(int id) => _localDS.delete(id);

  @override
  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  }) async {
    final current = _localDS.getById(id);
    if (current == null) {
      throw Exception('Отметка не найдена');
    }
    final updated = current.copyWith(
      status: status,
      assignedControllerId: assignedControllerId ?? current.assignedControllerId,
    );
    await _localDS.save(updated);
    return RoadProblemMapper.toDto(updated);
  }

  @override
  Future<RoadProblemDTO> fetchMarkById(int id) async {
    final entity = _localDS.getById(id);
    if (entity == null) throw Exception('Отметка не найдена');
    return RoadProblemMapper.toDto(entity);
  }

  @override
  Future<MarkLikeResult> toggleLike(int markId) async {
    final mark = _localDS.getById(markId);
    if (mark == null) throw Exception('Отметка не найдена');
    final likes = (mark.likes ?? 0) + 1;
    await _localDS.save(mark.copyWith(likes: likes));
    return MarkLikeResult(markId: markId, likes: likes, likedByMe: true);
  }

  @override
  Future<MarkCommentsPage> fetchComments(
    int markId, {
    int page = 0,
    int size = 20,
  }) async {
    final mark = _localDS.getById(markId);
    final comments = mark?.comments ?? [];
    return MarkCommentsPage(
      content: comments
          .map(
            (c) => MarkCommentDTO(
              id: 0,
              markId: markId,
              author: c.author,
              text: c.text,
              createdAt: c.time,
            ),
          )
          .toList(),
      totalElements: comments.length,
    );
  }

  @override
  Future<MarkCommentDTO> addComment(int markId, String text) async {
    final mark = _localDS.getById(markId);
    if (mark == null) throw Exception('Отметка не найдена');
    final entity = CommentEntity(
      author: 'Вы',
      text: text,
      time: DateTime.now(),
    );
    final updatedComments = [...?mark.comments, entity];
    await _localDS.save(
      mark.copyWith(
        comments: updatedComments,
        commentsCount: updatedComments.length,
      ),
    );
    return MarkCommentDTO(
      id: 0,
      markId: markId,
      author: entity.author,
      text: entity.text,
      createdAt: entity.time,
      commentsCount: updatedComments.length,
    );
  }
}
