import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class qr_code extends StatefulWidget {
  const qr_code({super.key});

  @override
  State<qr_code> createState() => _qr_codeState();
}

class _qr_codeState extends State<qr_code> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
            returnImage: true, detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (barcodes) {
          print('hello');
          final List<Barcode> L = barcodes.barcodes;
          final Uint8List? image = barcodes.image;
          for (var element in L) {
            print(element.rawValue);
          }
        },
      ),
    );
  }
}
