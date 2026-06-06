import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

class MarkLikeResult {
  const MarkLikeResult({
    required this.markId,
    required this.likes,
    required this.likedByMe,
  });

  final int markId;
  final int likes;
  final bool likedByMe;

  factory MarkLikeResult.fromJson(Map<String, dynamic> json) => MarkLikeResult(
        markId: (json['mark_id'] as num).toInt(),
        likes: (json['likes'] as num?)?.toInt() ?? 0,
        likedByMe: json['liked_by_me'] as bool? ?? false,
      );
}

class MarkCommentDTO {
  const MarkCommentDTO({
    required this.id,
    required this.markId,
    required this.author,
    required this.text,
    required this.createdAt,
    this.authorUserId,
    this.commentsCount,
  });

  final int id;
  final int markId;
  final int? authorUserId;
  final String author;
  final String text;
  final DateTime createdAt;
  final int? commentsCount;

  Comment toComment() => Comment(
        id: id,
        authorUserId: authorUserId,
        author: author,
        text: text,
        time: createdAt,
      );

  factory MarkCommentDTO.fromJson(Map<String, dynamic> json) => MarkCommentDTO(
        id: (json['id'] as num).toInt(),
        markId: (json['mark_id'] as num).toInt(),
        authorUserId: (json['author_user_id'] as num?)?.toInt(),
        author: json['author'] as String? ?? 'User',
        text: json['text'] as String,
        createdAt: _dateOrNull(json['created_at']) ?? DateTime.now(),
        commentsCount: (json['comments_count'] as num?)?.toInt(),
      );

  static DateTime? _dateOrNull(Object? v) {
    if (v == null) return null;
    if (v is num) {
      final ms = v >= 1e12 ? v.toInt() : (v * 1000).round();
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    return DateTime.parse(v as String).toLocal();
  }
}

class MarkCommentsPage {
  const MarkCommentsPage({
    required this.content,
    required this.totalElements,
  });

  final List<MarkCommentDTO> content;
  final int totalElements;

  factory MarkCommentsPage.fromJson(dynamic data) {
    if (data is List) {
      final items = data
          .whereType<Map>()
          .map((e) => MarkCommentDTO.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return MarkCommentsPage(content: items, totalElements: items.length);
    }
    if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      final raw = map['content'];
      final items = raw is List
          ? raw
              .whereType<Map>()
              .map((e) => MarkCommentDTO.fromJson(Map<String, dynamic>.from(e)))
              .toList()
          : <MarkCommentDTO>[];
      return MarkCommentsPage(
        content: items,
        totalElements: (map['total_elements'] as num?)?.toInt() ?? items.length,
      );
    }
    return const MarkCommentsPage(content: [], totalElements: 0);
  }
}
