class RoadProblemDTO {
  final int id;
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
  final String? author;        // НОВОЕ - автор сообщения
  final int? likes;            // НОВОЕ - количество лайков
  final int? commentsCount;    // НОВОЕ - количество комментариев
  final List<Comment>? comments; // НОВОЕ - список комментариев

  RoadProblemDTO({
    required this.id,
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

  static List<RoadProblemDTO> getMockData() {
    return [
      RoadProblemDTO(
        id: 1,
        title: 'Большая яма на дороге',
        description: 'Огромная яма, объезжайте',
        address: 'ул. Абая, 143',
        latitude: 43.2603,
        longitude: 76.8999,
        type: 'damage',
        severity: 'critical',
        status: 'new',
        reportedDate: DateTime.now().subtract(const Duration(hours: 3)),
        images: [
          'https://media.licdn.com/dms/image/v2/D4E12AQFDWROeoipsew/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1692537656621?e=2147483647&v=beta&t=ZdSkf_3ZA2TONDQ1MTNrB1yWPgsPH7yIZ6qrP8dZn-Q', // замените на реальную ссылку
        ],
        author: 'Самат',
        likes: 15,
        commentsCount: 3,
        comments: [
          Comment(
            author: 'Максат',
            text: 'Объехал, все норм',
            time: DateTime.now().subtract(const Duration(hours: 1)),
          ),
        ],
      ),
      RoadProblemDTO(
        id: 2,
        title: 'Поврежденное покрытие',
        description: 'Асфальт разрушен на участке 5 метров',
        address: 'пр. Достык, 200',
        latitude: 43.240000,
        longitude: 76.892000,
        type: 'damage',
        severity: 'high',
        status: 'in_progress',
        reportedDate: DateTime.now().subtract(const Duration(days: 5)),
        images: [],
        author: 'Айдар',
        likes: 8,
        commentsCount: 2,
      ),
      RoadProblemDTO(
        id: 3,
        title: 'Трещины на дороге',
        description: 'Множественные трещины, требуется ремонт',
        address: 'ул. Сатпаева, 90',
        latitude: 43.235000,
        longitude: 76.895000,
        type: 'crack',
        severity: 'medium',
        status: 'new',
        reportedDate: DateTime.now().subtract(const Duration(days: 1)),
        images: [
          'https://media.licdn.com/dms/image/v2/D4E12AQFDWROeoipsew/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1692537656621?e=2147483647&v=beta&t=ZdSkf_3ZA2TONDQ1MTNrB1yWPgsPH7yIZ6qrP8dZn-Q'
        ],
        author: 'Нурлан',
        likes: 5,
        commentsCount: 1,
      ),
      RoadProblemDTO(
        id: 4,
        title: 'Просевший асфальт',
        description: 'Участок дороги просел после дождя',
        address: 'ул. Розыбакиева, 45',
        latitude: 43.242000,
        longitude: 76.887000,
        type: 'subsidence',
        severity: 'high',
        status: 'new',
        reportedDate: DateTime.now(),
        images: [
          'https://media.licdn.com/dms/image/v2/D4E12AQFDWROeoipsew/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1692537656621?e=2147483647&v=beta&t=ZdSkf_3ZA2TONDQ1MTNrB1yWPgsPH7yIZ6qrP8dZn-Q'
        ],
        author: 'Ерлан',
        likes: 12,
        commentsCount: 0,
      ),
    ];
  }
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