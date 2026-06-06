class AssignedControllerDTO {
  const AssignedControllerDTO({
    this.id,
    this.fullName,
    this.companyName,
  });

  final int? id;
  final String? fullName;
  final String? companyName;

  String? get displayName {
    final company = companyName?.trim();
    if (company != null && company.isNotEmpty) return company;
    final name = fullName?.trim();
    if (name != null && name.isNotEmpty) return name;
    return null;
  }

  factory AssignedControllerDTO.fromJson(Map<String, dynamic> json) =>
      AssignedControllerDTO(
        id: RoadProblemDTO._intOrNull(json['id']),
        fullName: json['full_name'] as String?,
        companyName: json['company_name'] as String?,
      );
}

class RoadProblemDTO {
  final int id;
  final int? authorUserId;
  final int? assignedControllerId;
  final AssignedControllerDTO? assignedController;
  final String? title;
  final String? description;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? type;
  final String? severity;
  final String? status;
  final DateTime? reportedDate;
  final List<String>? images;
  final String? author;
  final int? likes;
  final int? commentsCount;
  final List<Comment>? comments;
  final bool likedByMe;

  RoadProblemDTO({
    required this.id,
    this.authorUserId,
    this.assignedControllerId,
    this.assignedController,
    this.title,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.type,
    this.severity,
    this.status,
    this.reportedDate,
    this.images,
    this.author,
    this.likes,
    this.commentsCount,
    this.comments,
    this.likedByMe = false,
  });

  RoadProblemDTO copyWith({
    int? likes,
    int? commentsCount,
    List<Comment>? comments,
    bool? likedByMe,
  }) =>
      RoadProblemDTO(
        id: id,
        authorUserId: authorUserId,
        assignedControllerId: assignedControllerId,
        assignedController: assignedController,
        title: title,
        description: description,
        address: address,
        latitude: latitude,
        longitude: longitude,
        type: type,
        severity: severity,
        status: status,
        reportedDate: reportedDate,
        images: images,
        author: author,
        likes: likes ?? this.likes,
        commentsCount: commentsCount ?? this.commentsCount,
        comments: comments ?? this.comments,
        likedByMe: likedByMe ?? this.likedByMe,
      );

  factory RoadProblemDTO.fromJson(Map<String, dynamic> json) {
    return RoadProblemDTO(
      id: (json['id'] as num).toInt(),
      authorUserId: _intOrNull(json['author_user_id']),
      assignedControllerId: _intOrNull(json['assigned_controller_id']),
      assignedController: _assignedControllerOrNull(json['assigned_controller']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      latitude: _doubleOrNull(json['latitude']),
      longitude: _doubleOrNull(json['longitude']),
      type: json['type'] as String?,
      severity: json['severity'] as String?,
      status: json['status'] as String?,
      reportedDate: _dateOrNull(json['reported_date']),
      images: _stringListOrNull(json['images']),
      author: json['author'] as String?,
      likes: _intOrNull(json['likes']),
      commentsCount: _intOrNull(json['comments_count']),
      comments: _commentsOrNull(json),
      likedByMe: json['liked_by_me'] as bool? ?? false,
    );
  }

  List<String> get _remoteImages =>
      images?.where((u) => u.startsWith('http')).toList() ?? [];

  /// POST /api/marks — severity and author are set on the server (JWT).
  Map<String, dynamic> toCreateJson({List<String>? imageUrls}) => {
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (address != null) 'address': address,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (type != null) 'type': type,
        'images': imageUrls ??
            (_remoteImages.isNotEmpty ? _remoteImages : <String>[]),
      };

  String? get normalizedSeverity =>
      severity == 'critical' ? 'high' : severity;

  static AssignedControllerDTO? _assignedControllerOrNull(Object? v) {
    if (v is! Map) return null;
    return AssignedControllerDTO.fromJson(Map<String, dynamic>.from(v));
  }

  static List<Comment>? _commentsOrNull(Map<String, dynamic> json) {
    final latest = json['latest_comment'];
    if (latest is Map) {
      return [Comment.fromJson(Map<String, dynamic>.from(latest))];
    }
    final list = json['comments'];
    if (list is List) {
      return list
          .whereType<Map>()
          .map((e) => Comment.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return null;
  }

  static int? _intOrNull(Object? v) =>
      v == null ? null : (v as num).toInt();

  static double? _doubleOrNull(Object? v) =>
      v == null ? null : (v as num).toDouble();

  static DateTime? _dateOrNull(Object? v) {
    if (v == null) return null;
    if (v is num) {
      final ms = v >= 1e12 ? v.toInt() : (v * 1000).round();
      return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true).toLocal();
    }
    return DateTime.parse(v as String).toLocal();
  }

  static List<String>? _stringListOrNull(Object? v) {
    if (v is! List) return null;
    return v.map((e) => e.toString()).toList();
  }
}

class Comment {
  final int? id;
  final int? authorUserId;
  final String author;
  final String text;
  final DateTime time;

  Comment({
    this.id,
    this.authorUserId,
    required this.author,
    required this.text,
    required this.time,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: (json['id'] as num?)?.toInt(),
        authorUserId: (json['author_user_id'] as num?)?.toInt(),
        author: json['author'] as String? ?? 'User',
        text: json['text'] as String,
        time: RoadProblemDTO._dateOrNull(json['created_at']) ??
            RoadProblemDTO._dateOrNull(json['time']) ??
            DateTime.now(),
      );
}
