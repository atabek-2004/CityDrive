/// Статусы жалоб на дорожные проблемы.
abstract final class ReportStatus {
  static const newReport = 'new';
  static const pending = 'pending';
  static const confirmed = 'confirmed';
  static const controllerAssigned = 'controller_assigned';
  static const rejected = 'rejected';
  static const inProgress = 'in_progress';
  static const reportSubmitted = 'report_submitted';
  static const fixed = 'fixed';

  /// Accepted marks on the public map (`GET /api/marks`).
  static bool isVisibleOnMap(String? status) {
    switch (status) {
      case confirmed:
      case inProgress:
      case fixed:
        return true;
      default:
        return false;
    }
  }

  /// Own marks awaiting admin review (`GET /api/marks/mine`, status `new` / `pending`).
  static bool isUnderReview(String? status) =>
      status == newReport || status == pending;

  static bool isRejected(String? status) => status == rejected;

  /// Заявки из `GET /controller/dashboard` → `pending_marks` (без исполнителя).
  static bool isControllerNewAnnouncement(String? status) =>
      status == newReport || status == pending || status == confirmed;

  static bool canControllerAccept({
    required String? status,
    int? assignedControllerId,
  }) =>
      assignedControllerId == null && isControllerNewAnnouncement(status);

  static bool isControllerAwaitingAdmin({
    required String? status,
    int? assignedControllerId,
    required int controllerId,
  }) =>
      assignedControllerId == controllerId &&
      status == controllerAssigned;

  static bool isControllerInWork({
    required String? status,
    int? assignedControllerId,
    required int controllerId,
  }) =>
      assignedControllerId == controllerId && status == inProgress;

  static bool canControllerSubmitWorkReport({
    required String? status,
    int? assignedControllerId,
    required int controllerId,
  }) =>
      isControllerInWork(
        status: status,
        assignedControllerId: assignedControllerId,
        controllerId: controllerId,
      );

  static bool isControllerReportAwaitingReview({
    required String? status,
    int? assignedControllerId,
    required int controllerId,
  }) =>
      assignedControllerId == controllerId && status == reportSubmitted;

  /// Shown on the map: accepted public + own new/pending (rejected hidden).
  static bool showOnMap(String? status) {
    if (isRejected(status)) return false;
    return isVisibleOnMap(status) || isUnderReview(status);
  }

  /// Лайки и комментарии — только для публичных отметок на карте.
  static bool canEngage(String? status) => isVisibleOnMap(status);

  static String? engageBlockedReasonRu(String? status) {
    if (canEngage(status)) return null;
    if (isUnderReview(status)) {
      return 'Комментарии и лайки будут доступны после одобрения отметки администратором.';
    }
    if (isRejected(status)) {
      return 'К отклонённой отметке нельзя оставить комментарий.';
    }
    return 'Комментарии и лайки недоступны для этой отметки.';
  }

  static String labelRu(String? status) {
    switch (status) {
      case pending:
      case newReport:
        return 'На проверке';
      case confirmed:
        return 'Принята';
      case controllerAssigned:
        return 'Проверка админом';
      case rejected:
        return 'Отклонена';
      case inProgress:
        return 'В работе';
      case reportSubmitted:
        return 'На проверке';
      case fixed:
        return 'Исправлено';
      default:
        return 'На проверке';
    }
  }
}
