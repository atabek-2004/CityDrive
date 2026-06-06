import 'package:dio/dio.dart';
import 'package:city_drive/src/feature/main/model/news_dto.dart';

/// Public news feed (`GET /api/news`, no JWT required).
class NewsRemoteDS {
  NewsRemoteDS(this._dio);

  final Dio _dio;

  Future<List<NewsDTO>> fetchList({int limit = 20, int offset = 0}) async {
    final response = await _dio.get<dynamic>(
      'news',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );
    return _parseList(response.data);
  }

  Future<NewsDTO> fetchById(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('news/$id');
    return NewsDTO.fromJson(response.data!);
  }

  List<NewsDTO> _parseList(dynamic data) {
    if (data is! List) return [];
    return data
        .whereType<Map>()
        .map((e) => NewsDTO.fromJson(Map<String, dynamic>.from(e)))
        .where((n) => n.isPublished)
        .toList();
  }
}
