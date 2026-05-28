import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ReportDetailPage extends StatefulWidget {
  final String imageUrl;
  const ReportDetailPage({
    super.key,
    required this.reportId,
    required this.imageUrl,
  });

  final String reportId;

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.maybePop(),
        ),
        title: const Text(
          'Детали отметки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main image
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey.shade300,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                      size: 60,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Провал на дороге',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(8),

                  // Address
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      const Gap(4),
                      Text(
                        'ул. Абая, 150',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),

                  // Description section
                  const Text(
                    'ОПИСАНИЕ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Глубокий провал на дороге, примерно 40 см. Опасно для машин и пешеходов. Находится возле автобусной остановки.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                      height: 1.5,
                    ),
                  ),
                  const Gap(32),

                  // Status timeline
                  const Text(
                    'Статус заявки',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(20),

                  StatusTimeline(
                    steps: [
                      StatusStep(
                        title: 'Отправлено на проверку',
                        isCompleted: true,
                        isActive: false,
                        color: const Color(0xFF34C759),
                      ),
                      StatusStep(
                        title: 'Подтверждено',
                        isCompleted: true,
                        isActive: true,
                        color: Colors.orange,
                      ),
                      StatusStep(
                        title: 'Ждёт ремонта',
                        isCompleted: false,
                        isActive: false,
                        color: Colors.grey,
                      ),
                      StatusStep(
                        title: 'В работе',
                        isCompleted: false,
                        isActive: false,
                        color: Colors.grey,
                      ),
                      StatusStep(
                        title: 'Решено',
                        isCompleted: false,
                        isActive: false,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const Gap(32),

                  // Info text
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Администратор проверит вашу отметку и подтвердит её или отклонит. Вы получите уведомление о решении.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const Gap(24),

                  // Delete button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _showDeleteDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF3B30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Удалить отметку',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить отметку?'),
        content: const Text('Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.router.maybePop();
            },
            child: const Text(
              'Удалить',
              style: TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusStep {
  final String title;
  final bool isCompleted;
  final bool isActive;
  final Color color;

  StatusStep({
    required this.title,
    required this.isCompleted,
    required this.isActive,
    required this.color,
  });
}

class StatusTimeline extends StatelessWidget {
  final List<StatusStep> steps;

  const StatusTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: step.isCompleted || step.isActive
                        ? step.color
                        : Colors.grey.shade300,
                  ),
                  child: step.isCompleted
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        )
                      : step.isActive
                          ? const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 18,
                            )
                          : null,
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey.shade300,
                  ),
              ],
            ),
            const Gap(12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  step.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        step.isActive ? FontWeight.w600 : FontWeight.w400,
                    color: step.isCompleted || step.isActive
                        ? Colors.black
                        : Colors.grey.shade500,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
