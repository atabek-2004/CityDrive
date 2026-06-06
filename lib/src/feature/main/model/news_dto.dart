class NewsDTO {
  const NewsDTO({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    this.publishedAt,
    this.isPublished = true,
  });

  final int id;
  final String title;
  final String description;
  final String? imageUrl;
  final DateTime? publishedAt;
  final bool isPublished;

  factory NewsDTO.fromJson(Map<String, dynamic> json) {
    return NewsDTO(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      publishedAt: _dateOrNull(json['published_at']),
      isPublished: json['is_published'] as bool? ??
          json['published'] as bool? ??
          true,
    );
  }

  static DateTime? _dateOrNull(Object? v) {
    if (v == null) return null;
    if (v is num) {
      final ms = v >= 1e12 ? v.toInt() : (v * 1000).round();
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    return DateTime.parse(v as String).toLocal();
  }
}
