import 'package:city_drive/src/core/local_storage/models/road_problem_entity.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

abstract final class RoadProblemMapper {
  static RoadProblemDTO toDto(RoadProblemEntity entity) => RoadProblemDTO(
        id: entity.id,
        authorUserId: entity.authorUserId,
        title: entity.title,
        description: entity.description,
        address: entity.address,
        latitude: entity.latitude,
        longitude: entity.longitude,
        type: entity.type,
        severity: entity.severity,
        status: entity.status,
        reportedDate: entity.reportedDate,
        images: entity.images,
        author: entity.author,
        likes: entity.likes,
        commentsCount: entity.commentsCount,
        comments: entity.comments
            ?.map(
              (c) => Comment(
                author: c.author,
                text: c.text,
                time: c.time,
              ),
            )
            .toList(),
        assignedControllerId: entity.assignedControllerId,
      );

  static RoadProblemEntity fromDto(RoadProblemDTO dto) => RoadProblemEntity(
        id: dto.id,
        authorUserId: dto.authorUserId ?? 0,
        title: dto.title,
        description: dto.description,
        address: dto.address,
        latitude: dto.latitude,
        longitude: dto.longitude,
        type: dto.type,
        severity: dto.severity,
        status: dto.status,
        reportedDate: dto.reportedDate,
        images: dto.images,
        author: dto.author,
        likes: dto.likes,
        commentsCount: dto.commentsCount,
        comments: dto.comments
            ?.map(
              (c) => CommentEntity(
                author: c.author,
                text: c.text,
                time: c.time,
              ),
            )
            .toList(),
        assignedControllerId: dto.assignedControllerId,
      );
}
