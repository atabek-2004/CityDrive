class RoadProblemDTO {
  final int id;
  final int? authorUserId;
  final int? assignedControllerId;
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

  RoadProblemDTO({
    required this.id,
    this.authorUserId,
    this.assignedControllerId,
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
  });
}

class Comment {
  final String author;
  final String text;
  final DateTime time;

  Comment({
    required this.author,
    required this.text,
    required this.time,
  });
}