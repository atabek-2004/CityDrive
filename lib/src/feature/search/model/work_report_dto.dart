class WorkReportDTO {
  const WorkReportDTO({
    this.description,
    this.images = const [],
    this.submittedAt,
  });

  final String? description;
  final List<String> images;
  final DateTime? submittedAt;

  factory WorkReportDTO.fromJson(Map<String, dynamic> json) => WorkReportDTO(
        description: json['description'] as String?,
        images: _imagesFromJson(json['images']),
        submittedAt: _dateOrNull(json['submitted_at']),
      );

  static WorkReportDTO? fromMarkJson(Map<String, dynamic> json) {
    final nested = json['work_report'];
    if (nested is Map) {
      return WorkReportDTO.fromJson(Map<String, dynamic>.from(nested));
    }
    final flatImages = _imagesFromJson(json['work_report_images']);
    final flatDescription = json['work_report_description'] as String?;
    if (flatImages.isEmpty && (flatDescription == null || flatDescription.isEmpty)) {
      return null;
    }
    return WorkReportDTO(
      description: flatDescription,
      images: flatImages,
    );
  }

  static List<String> _imagesFromJson(Object? value) {
    if (value is! List) return const [];
    return value.map((e) => e.toString()).toList();
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
