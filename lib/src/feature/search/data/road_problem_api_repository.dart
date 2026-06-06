import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/data/road_problem_remote_ds.dart';
import 'package:city_drive/src/feature/search/data/road_problem_repository.dart';
import 'package:city_drive/src/feature/search/model/mark_engagement_dto.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

/// Road marks loaded from Spring Boot API (shared with admin panel).
class RoadProblemApiRepository implements IRoadProblemRepository {
  RoadProblemApiRepository(this._remote);

  final RoadProblemRemoteDS _remote;
  List<RoadProblemDTO> _cache = [];
  List<RoadProblemDTO> _mineCache = [];
  List<RoadProblemDTO> _pendingCache = [];
  List<RoadProblemDTO> _mineForControllerCache = [];
  final Map<int, RoadProblemDTO> _detailCache = {};

  @override
  Future<void> refresh() async {
    _cache = await _remote.fetchAll();
  }

  @override
  Future<void> refreshPending({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      _pendingCache = await _remote.fetchPending(
        q: q,
        severity: severity,
        type: type,
        limit: limit,
        offset: offset,
      );
    } catch (_) {
      _pendingCache = await _remote.fetchPendingLegacy();
    }
  }

  @override
  Future<void> refreshMineForController({int? controllerUserId}) async {
    try {
      final remote = await _remote.fetchControllerMarksMine();
      if (remote.isNotEmpty) {
        _mineForControllerCache = remote;
        return;
      }
    } catch (_) {
      // Fall through to GET /marks filter.
    }

    if (_cache.isEmpty) {
      try {
        await refresh();
      } catch (_) {}
    }

    if (controllerUserId != null) {
      _mineForControllerCache = getAssignedToController(controllerUserId);
    } else {
      _mineForControllerCache = [];
    }
  }

  @override
  void cacheMineForController(List<RoadProblemDTO> marks) {
    _mineForControllerCache = List<RoadProblemDTO>.from(marks);
  }

  @override
  void cachePendingForController(List<RoadProblemDTO> marks) {
    _pendingCache = List<RoadProblemDTO>.from(marks);
  }

  @override
  List<RoadProblemDTO> getMineForController() =>
      List.unmodifiable(_mineForControllerCache);

  @override
  Future<void> refreshMine() async {
    _mineCache = await _remote.fetchMine();
  }

  @override
  List<RoadProblemDTO> getMine() => List.unmodifiable(_mineCache);

  @override
  List<RoadProblemDTO> getAll() {
    final byId = <int, RoadProblemDTO>{};
    for (final p in _cache) {
      if (ReportStatus.isVisibleOnMap(p.status)) {
        byId[p.id] = p;
      }
    }
    for (final p in _mineCache) {
      if (ReportStatus.isRejected(p.status)) continue;
      byId[p.id] = p;
    }
    return List.unmodifiable(byId.values);
  }

  @override
  List<RoadProblemDTO> getByAuthorId(
    int authorUserId, {
    String? authorName,
  }) =>
      getMine().isNotEmpty
          ? getMine()
          : getAll().where(
              (p) =>
                  p.authorUserId == authorUserId ||
                  (p.authorUserId == null &&
                      authorName != null &&
                      p.author == authorName),
            ).toList();

  @override
  List<RoadProblemDTO> getPendingForController() =>
      List.unmodifiable(_pendingCache);

  @override
  List<RoadProblemDTO> getAssignedToController(int controllerId) => _cache
      .where(
        (p) =>
            p.assignedControllerId == controllerId &&
            (p.status == ReportStatus.confirmed ||
                p.status == ReportStatus.inProgress ||
                p.status == ReportStatus.fixed),
      )
      .toList();

  @override
  RoadProblemDTO? getById(int id) {
    final cached = _detailCache[id];
    if (cached != null) return cached;
    for (final list in [
      _mineForControllerCache,
      _pendingCache,
      _mineCache,
      _cache,
    ]) {
      for (final p in list) {
        if (p.id == id) return p;
      }
    }
    return null;
  }

  @override
  Future<RoadProblemDTO> add(
    RoadProblemDTO problem, {
    String? localImagePath,
  }) async {
    List<String>? imageUrls;
    if (localImagePath != null && localImagePath.isNotEmpty) {
      imageUrls = [await _remote.uploadImage(localImagePath)];
    } else if (problem.images != null) {
      final remote =
          problem.images!.where((u) => u.startsWith('http')).toList();
      if (remote.isNotEmpty) imageUrls = remote;
    }

    final saved = await _remote.create(problem, imageUrls: imageUrls);
    await refresh();
    await refreshMine();
    return saved;
  }

  @override
  Future<RoadProblemDTO> update(RoadProblemDTO problem) async {
    await refresh();
    await refreshMine();
    return getById(problem.id) ?? problem;
  }

  @override
  Future<void> delete(int id) async {
    await _remote.delete(id);
    await refresh();
    await refreshMine();
  }

  @override
  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    String? comment,
  }) async {
    final updated = await _remote.updateStatus(
      id: id,
      status: status,
      assignedControllerId: assignedControllerId,
      comment: comment,
    );
    await refresh();
    await refreshMine();
    await refreshPending();
    return updated;
  }

  void _patchMark(
    int id, {
    int? likes,
    bool? likedByMe,
    int? commentsCount,
    List<Comment>? comments,
  }) {
    RoadProblemDTO patch(RoadProblemDTO p) {
      if (p.id != id) return p;
      return p.copyWith(
        likes: likes,
        likedByMe: likedByMe,
        commentsCount: commentsCount,
        comments: comments,
      );
    }

    _cache = _cache.map(patch).toList();
    _mineCache = _mineCache.map(patch).toList();
    _pendingCache = _pendingCache.map(patch).toList();
    _mineForControllerCache = _mineForControllerCache.map(patch).toList();
  }

  void _upsertMark(RoadProblemDTO mark) {
    _detailCache[mark.id] = mark;

    List<RoadProblemDTO> replace(List<RoadProblemDTO> list) => list
        .map((p) => p.id == mark.id ? mark : p)
        .toList(growable: false);

    _cache = replace(_cache);
    _mineCache = replace(_mineCache);
    _pendingCache = replace(_pendingCache);
    _mineForControllerCache = replace(_mineForControllerCache);
  }

  @override
  Future<RoadProblemDTO> fetchMarkById(int id) async {
    final mark = await _remote.fetchById(id);
    _upsertMark(mark);
    return mark;
  }

  @override
  Future<MarkLikeResult> toggleLike(int markId) async {
    final result = await _remote.toggleLike(markId);
    _patchMark(
      markId,
      likes: result.likes,
      likedByMe: result.likedByMe,
    );
    return result;
  }

  @override
  Future<MarkCommentsPage> fetchComments(
    int markId, {
    int page = 0,
    int size = 20,
  }) async {
    return _remote.fetchComments(markId, page: page, size: size);
  }

  @override
  Future<MarkCommentDTO> addComment(int markId, String text) async {
    final created = await _remote.addComment(markId, text);
    await fetchMarkById(markId);
    return created;
  }
}
