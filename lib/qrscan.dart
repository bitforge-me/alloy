import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:zapdart/widgets.dart';
import 'package:zapdart/colors.dart';

class QrScan extends StatefulWidget {
  QrScan() : super();

  @override
  _QrScanState createState() => _QrScanState();

  static Future<String?> scan(BuildContext context) async {
    return await Navigator.push<String>(
        context, MaterialPageRoute(builder: (context) => QrScan()));
  }
}

class _QrScanState extends State<QrScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var controller = MobileScannerController(facing: CameraFacing.back);
  bool stopped = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.stop();
    } else if (Platform.isIOS) {
      controller.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: backButton(context, color: ZapBlack, onPressed: () {
            stopped = true;
            controller.stop();
            Navigator.of(context).pop();
          }),
          actions: [
            IconButton(
                onPressed: () => controller.switchCamera(),
                icon: Icon(Icons.change_circle))
          ],
          title: Text("QR Code Scan"),
        ),
        body: Container(
          child: MobileScanner(
              key: qrKey,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) return;
                Navigator.of(context).pop(barcode.rawValue!);
              }),
        ),
      ),
      onWillPop: () {
        stopped = true;
        controller.stop();
        return Future<bool>.value(true);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
