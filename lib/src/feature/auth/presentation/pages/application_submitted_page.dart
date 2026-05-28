import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';

@RoutePage()
class ApplicationSubmittedPage extends StatelessWidget {
  const ApplicationSubmittedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),

              Image.asset(
                Assets.images.png.timeLeft1.path,
                width: 81,
                height: 81,
              ),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Заявка отправлена',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Ваша заявка на регистрацию отправлена на проверку. Мы уведомим вас о результате.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Status card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Статус заявки',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'На рассмотрении',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Timeline card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Примерный срок',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '1-3 рабочих дня',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class ClockIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw main arc (270 degrees, starting from top)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      math.pi * 1.5, // 270 degrees
      false,
      paint,
    );

    // Draw arrow at the end of arc
    final arrowAngle = math.pi * 1.0; // 180 degrees from start
    final arrowTipX = center.dx + radius * math.cos(arrowAngle);
    final arrowTipY = center.dy + radius * math.sin(arrowAngle);

    final arrowPath = Path();
    arrowPath.moveTo(arrowTipX, arrowTipY);
    arrowPath.lineTo(
      arrowTipX - 15 * math.cos(arrowAngle - 0.5),
      arrowTipY - 15 * math.sin(arrowAngle - 0.5),
    );
    arrowPath.moveTo(arrowTipX, arrowTipY);
    arrowPath.lineTo(
      arrowTipX - 15 * math.cos(arrowAngle + 0.5),
      arrowTipY - 15 * math.sin(arrowAngle + 0.5),
    );

    canvas.drawPath(arrowPath, paint);

    // Draw clock hands
    // Hour hand (pointing to 10)
    final hourAngle = -math.pi / 2 + (10 * math.pi / 6);
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius * 0.4) * math.cos(hourAngle),
        center.dy + (radius * 0.4) * math.sin(hourAngle),
      ),
      paint,
    );

    // Minute hand (pointing to 2)
    final minuteAngle = -math.pi / 2 + (2 * math.pi / 6);
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius * 0.6) * math.cos(minuteAngle),
        center.dy + (radius * 0.6) * math.sin(minuteAngle),
      ),
      paint,
    );

    // Draw dotted arc on the right side
    final dottedPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 5; i++) {
      final angle = math.pi * 1.0 + (i * 0.15);
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 3, dottedPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
