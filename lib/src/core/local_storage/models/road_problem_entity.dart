import 'package:city_drive/src/core/local_storage/hive_json_util.dart';

class CommentEntity {
  const CommentEntity({
    required this.author,
    required this.text,
    required this.time,
  });

  final String author;
  final String text;
  final DateTime time;

  Map<String, dynamic> toJson() => {
        'author': author,
        'text': text,
        'time': time.toIso8601String(),
      };

  factory CommentEntity.fromJson(Map<String, dynamic> json) => CommentEntity(
        author: json['author'] as String,
        text: json['text'] as String,
        time: DateTime.parse(json['time'] as String),
      );
}

class RoadProblemEntity {
  const RoadProblemEntity({
    required this.id,
    required this.authorUserId,
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
    this.assignedControllerId,
  });

  final int id;
  final int authorUserId;
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
  final List<CommentEntity>? comments;
  final int? assignedControllerId;

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorUserId': authorUserId,
        'title': title,
        'description': description,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'type': type,
        'severity': severity,
        'status': status,
        'reportedDate': reportedDate?.toIso8601String(),
        'images': images,
        'author': author,
        'likes': likes,
        'commentsCount': commentsCount,
        'comments': comments?.map((c) => c.toJson()).toList(),
        'assignedControllerId': assignedControllerId,
      };

  factory RoadProblemEntity.fromJson(Map<String, dynamic> json) =>
      RoadProblemEntity(
        id: (json['id'] as num).toInt(),
        authorUserId: (json['authorUserId'] as num?)?.toInt() ?? 0,
        title: json['title'] as String?,
        description: json['description'] as String?,
        address: json['address'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        type: json['type'] as String?,
        severity: json['severity'] as String?,
        status: json['status'] as String?,
        reportedDate: json['reportedDate'] != null
            ? DateTime.parse(json['reportedDate'] as String)
            : null,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        author: json['author'] as String?,
        likes: (json['likes'] as num?)?.toInt(),
        commentsCount: (json['commentsCount'] as num?)?.toInt(),
        comments: hiveMapList(json['comments'])
            ?.map(CommentEntity.fromJson)
            .toList(),
        assignedControllerId:
            (json['assignedControllerId'] as num?)?.toInt(),
      );

  RoadProblemEntity copyWith({
    int? id,
    int? authorUserId,
    String? title,
    String? description,
    String? address,
    double? latitude,
    double? longitude,
    String? type,
    String? severity,
    String? status,
    DateTime? reportedDate,
    List<String>? images,
    String? author,
    int? likes,
    int? commentsCount,
    List<CommentEntity>? comments,
    int? assignedControllerId,
  }) =>
      RoadProblemEntity(
        id: id ?? this.id,
        authorUserId: authorUserId ?? this.authorUserId,
        title: title ?? this.title,
        description: description ?? this.description,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        type: type ?? this.type,
        severity: severity ?? this.severity,
        status: status ?? this.status,
        reportedDate: reportedDate ?? this.reportedDate,
        images: images ?? this.images,
        author: author ?? this.author,
        likes: likes ?? this.likes,
        commentsCount: commentsCount ?? this.commentsCount,
        comments: comments ?? this.comments,
        assignedControllerId:
            assignedControllerId ?? this.assignedControllerId,
      );
}
