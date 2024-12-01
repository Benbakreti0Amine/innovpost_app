import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class qr_code extends StatefulWidget {
  const qr_code({super.key});

  @override
  State<qr_code> createState() => _qr_codeState();
}

class _qr_codeState extends State<qr_code> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: MobileScannerController(
            returnImage: true,
            detectionSpeed: DetectionSpeed.noDuplicates,
          ),
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes) {
              debugPrint('Barcode found! ${barcode.rawValue}');
            }
          },
        ),
        CustomPaint(
          painter: ScannerOverlay(),
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}

class ScannerOverlay extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double scanAreaSize = size.width * 0.7;
    final double left = (size.width - scanAreaSize) / 2;
    final double top = (size.height - scanAreaSize) / 2;
    final double right = left + scanAreaSize;
    final double bottom = top + scanAreaSize;

    final Paint backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5);

    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Draw the semi-transparent background
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the transparent scanner area
    canvas.drawRect(Rect.fromLTRB(left, top, right, bottom),
        Paint()..blendMode = BlendMode.clear);

    // Draw the white border around the scanner area
    canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), borderPaint);

    // Draw corner markers
    const double cornerSize = 20;
    canvas.drawLine(
        Offset(left, top), Offset(left + cornerSize, top), borderPaint);
    canvas.drawLine(
        Offset(left, top), Offset(left, top + cornerSize), borderPaint);

    canvas.drawLine(
        Offset(right, top), Offset(right - cornerSize, top), borderPaint);
    canvas.drawLine(
        Offset(right, top), Offset(right, top + cornerSize), borderPaint);

    canvas.drawLine(
        Offset(left, bottom), Offset(left + cornerSize, bottom), borderPaint);
    canvas.drawLine(
        Offset(left, bottom), Offset(left, bottom - cornerSize), borderPaint);

    canvas.drawLine(
        Offset(right, bottom), Offset(right - cornerSize, bottom), borderPaint);
    canvas.drawLine(
        Offset(right, bottom), Offset(right, bottom - cornerSize), borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
