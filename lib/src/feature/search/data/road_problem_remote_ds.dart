import 'dart:io';

import 'package:dio/dio.dart';
import 'package:city_drive/src/feature/search/model/mark_engagement_dto.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

class RoadProblemRemoteDS {
  RoadProblemRemoteDS(this._dio);

  final Dio _dio;

  Future<List<RoadProblemDTO>> fetchAll() async {
    final response = await _dio.get<dynamic>('marks');
    return _parseList(response.data);
  }

  Future<List<RoadProblemDTO>> fetchPending({
    String? q,
    String? severity,
    String? type,
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _dio.get<dynamic>(
      'marks/pending',
      queryParameters: {
        if (q != null && q.isNotEmpty) 'q': q,
        if (severity != null && severity.isNotEmpty) 'severity': severity,
        if (type != null && type.isNotEmpty) 'type': type,
        'limit': limit,
        'offset': offset,
      },
    );
    return _parseList(response.data);
  }

  Future<List<RoadProblemDTO>> fetchControllerMarksMine() async {
    try {
      final response = await _dio.get<dynamic>('controller/marks/mine');
      return _parseList(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 501) {
        return [];
      }
      rethrow;
    }
  }

  Future<List<RoadProblemDTO>> fetchPendingLegacy() async {
    final response = await _dio.get<dynamic>('marks/pending');
    return _parseList(response.data);
  }

  /// Current user's marks (including `new` / `pending` for map overlay).
  Future<List<RoadProblemDTO>> fetchMine() async {
    final response = await _dio.get<dynamic>('marks/mine');
    return _parseList(response.data);
  }

  Future<RoadProblemDTO> fetchById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('marks/$id');
    return RoadProblemDTO.fromJson(response.data!);
  }

  Future<String> uploadImage(String localFilePath) async {
    final file = File(localFilePath);
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
      ),
    });
    final response = await _dio.post<Map<String, dynamic>>(
      'marks/upload',
      data: formData,
    );
    final url = response.data?['image_url'] as String?;
    if (url == null || url.isEmpty) {
      throw DioException(
        requestOptions: response.requestOptions,
        message: 'Upload response missing image_url',
      );
    }
    return url;
  }

  Future<RoadProblemDTO> create(
    RoadProblemDTO problem, {
    List<String>? imageUrls,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'marks',
      data: problem.toCreateJson(imageUrls: imageUrls),
    );
    return RoadProblemDTO.fromJson(response.data!);
  }

  Future<RoadProblemDTO> updateStatus({
    required int id,
    required String status,
    int? assignedControllerId,
    bool clearAssignedController = false,
    String? comment,
  }) async {
    final response = await _dio.patch<Map<String, dynamic>>(
      'marks/$id/status',
      data: {
        'status': status,
        if (clearAssignedController)
          'assigned_controller_id': null
        else if (assignedControllerId != null)
          'assigned_controller_id': assignedControllerId,
        if (comment != null && comment.isNotEmpty) 'comment': comment,
      },
    );
    return RoadProblemDTO.fromJson(response.data!);
  }

  Future<RoadProblemDTO> submitWorkReport({
    required int id,
    String? description,
    required List<String> localImagePaths,
  }) async {
    final files = <MultipartFile>[];
    for (var i = 0; i < localImagePaths.length; i++) {
      final path = localImagePaths[i];
      files.add(
        await MultipartFile.fromFile(
          path,
          filename: 'photo${i + 1}.jpg',
        ),
      );
    }

    final formData = FormData.fromMap({
      if (description != null && description.trim().isNotEmpty)
        'description': description.trim(),
      if (files.isNotEmpty) 'images': files,
    });

    final response = await _dio.post<Map<String, dynamic>>(
      'marks/$id/work-report',
      data: formData,
    );
    return RoadProblemDTO.fromJson(response.data!);
  }

  Future<void> delete(int id) async {
    await _dio.delete<void>('marks/$id');
  }

  Future<MarkLikeResult> toggleLike(int markId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'marks/$markId/like',
      options: Options(contentType: Headers.jsonContentType),
    );
    return MarkLikeResult.fromJson(response.data!);
  }

  Future<MarkCommentsPage> fetchComments(
    int markId, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get<dynamic>(
      'marks/$markId/comments',
      queryParameters: {'page': page, 'size': size},
    );
    return MarkCommentsPage.fromJson(response.data);
  }

  Future<MarkCommentDTO> addComment(int markId, String text) async {
    final response = await _dio.post<Map<String, dynamic>>(
      'marks/$markId/comments',
      data: {'text': text},
      options: Options(
        contentType: Headers.jsonContentType,
        validateStatus: (status) => status != null && status < 500,
      ),
    );
    if (response.statusCode == 403) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message:
            'Сервер запретил комментарий (403). Нужно открыть POST /marks/{id}/comments для авторизованных RESIDENT/CONTROLLER на бэкенде.',
      );
    }
    if (response.statusCode != null &&
        response.statusCode! >= 400) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message: 'Ошибка ${response.statusCode} при отправке комментария',
      );
    }
    return MarkCommentDTO.fromJson(response.data!);
  }

  List<RoadProblemDTO> _parseList(dynamic data) {
    if (data is! List) return [];
    return data
        .whereType<Map>()
        .map((e) => RoadProblemDTO.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
