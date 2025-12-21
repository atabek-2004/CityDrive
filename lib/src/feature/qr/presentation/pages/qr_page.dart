import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  _MyOrdersState createState() => _MyOrdersState();


}

class _MyOrdersState extends State<QrPage> with SingleTickerProviderStateMixin {
  MobileScannerController cameraController = MobileScannerController();
  bool isScanned = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              if (!isScanned) {
                final barcode = capture.barcodes.first;

                final raw = barcode.rawValue;
                if (raw != null) {
                  setState(() => isScanned = true);

                  // BlocProvider.of<QrCubit>(context).sendQrCode(
                  //   qrCode: raw,
                  // );
                }
              }
            },
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: ScannerOverlay(
                  linePosition: _animation.value,
                ),
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ScannerOverlay extends CustomPainter {
  final double linePosition;

  ScannerOverlay({required this.linePosition});
  @override
  void paint(Canvas canvas, Size size) {
    final double scanAreaSize = size.width * 0.7;
    final double left = (size.width - scanAreaSize) / 2;
    final double top = (size.height - scanAreaSize) / 2;

    final paint = Paint()..color = Colors.black.withOpacity(0.5);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, top),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(0, top + scanAreaSize, size.width,
          size.height - (top + scanAreaSize)),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(0, top, left, scanAreaSize),
      paint,
    );

    canvas.drawRect(
      Rect.fromLTWH(left + scanAreaSize, top,
          size.width - (left + scanAreaSize), scanAreaSize),
      paint,
    );

    final bracketPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final bracketLength = 30.0;

    canvas.drawLine(
      Offset(left, top),
      Offset(left + bracketLength, top),
      bracketPaint,
    );
    canvas.drawLine(
      Offset(left, top),
      Offset(left, top + bracketLength),
      bracketPaint,
    );

    canvas.drawLine(
      Offset(left + scanAreaSize - bracketLength, top),
      Offset(left + scanAreaSize, top),
      bracketPaint,
    );
    canvas.drawLine(
      Offset(left + scanAreaSize, top),
      Offset(left + scanAreaSize, top + bracketLength),
      bracketPaint,
    );

    canvas.drawLine(
      Offset(left, top + scanAreaSize - bracketLength),
      Offset(left, top + scanAreaSize),
      bracketPaint,
    );
    canvas.drawLine(
      Offset(left, top + scanAreaSize),
      Offset(left + bracketLength, top + scanAreaSize),
      bracketPaint,
    );

    canvas.drawLine(
      Offset(left + scanAreaSize, top + scanAreaSize - bracketLength),
      Offset(left + scanAreaSize, top + scanAreaSize),
      bracketPaint,
    );
    canvas.drawLine(
      Offset(left + scanAreaSize - bracketLength, top + scanAreaSize),
      Offset(left + scanAreaSize, top + scanAreaSize),
      bracketPaint,
    );

    final double lineY = top + scanAreaSize * linePosition;

    final linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(left + 10, lineY),
      Offset(left + scanAreaSize - 10, lineY),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScannerOverlay oldDelegate) =>
      oldDelegate.linePosition != linePosition;
}
