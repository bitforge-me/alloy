import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
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
                  controller.stop();
                  Navigator.of(context).pop(barcode.rawValue!);
                },
                controller: controller)),
      ),
      onPopInvoked: (_) {
        stopped = true;
        controller.stop();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
