import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';

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
              const Text(
                'Заявка отправлена',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Регистрация компании завершена. Можете начать работу в приложении.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
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
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    final authUser = context.repository.authRepository.user;
                    if (authUser != null) {
                      BlocProvider.of<AppBloc>(context).add(
                        AppEvent.logining(user: authUser),
                      );
                    }
                    context.router.replaceAll([const LauncherRoute()]);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Перейти в приложение',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
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

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 1.5,
      false,
      paint,
    );

    final arrowAngle = math.pi * 1.0;
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

    final hourAngle = -math.pi / 2 + (10 * math.pi / 6);
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius * 0.4) * math.cos(hourAngle),
        center.dy + (radius * 0.4) * math.sin(hourAngle),
      ),
      paint,
    );

    final minuteAngle = -math.pi / 2 + (2 * math.pi / 6);
    canvas.drawLine(
      center,
      Offset(
        center.dx + (radius * 0.6) * math.cos(minuteAngle),
        center.dy + (radius * 0.6) * math.sin(minuteAngle),
      ),
      paint,
    );

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
