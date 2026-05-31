/// Статусы жалоб на дорожные проблемы.
abstract final class ReportStatus {
  static const newReport = 'new';
  static const pending = 'pending';
  static const confirmed = 'confirmed';
  static const rejected = 'rejected';
  static const inProgress = 'in_progress';
  static const fixed = 'fixed';

  static String labelRu(String? status) {
    switch (status) {
      case pending:
      case newReport:
        return 'На рассмотрении';
      case confirmed:
        return 'Подтверждена';
      case rejected:
        return 'Отклонена';
      case inProgress:
        return 'В работе';
      case fixed:
        return 'Исправлено';
      default:
        return 'На рассмотрении';
    }
  }
}
