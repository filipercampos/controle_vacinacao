import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:controle_vacinacao/app/modules/control/pages/qrcode/qrcode_controller.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  late StreamSubscription _subscription;
  final controller = GetIt.I.get<QrCodeController>();
  final qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    controller.barCodeResult = null;
    controller.frontCamera = false;
    controller.flashLight = false;
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.qrViewcontroller!.pauseCamera();
    }
    controller.qrViewcontroller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            child: _buildQrView(context),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Observer(builder: (_) {
                    return Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: controller.flashLight
                            ? Colors.amber[500]
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          controller.flashLight
                              ? Icons.flash_on
                              : Icons.flash_off,
                          size: 16,
                        ),
                        onPressed: controller.toogleFlash,
                      ),
                    );
                  }),
                  Observer(builder: (_) {
                    return Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: controller.frontCamera
                            ? Colors.amber[500]
                            : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.flip_camera_ios,
                          size: 16,
                        ),
                        onPressed: controller.flipCamera,
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          //Control
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  if (controller.qrcode.isEmpty)
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Escanear código identificação',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  return Text(
                    controller.barcodeFormat,
                    style: TextStyle(color: Colors.white),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(24),
                      child: TextButton(
                        onPressed: () async {
                          await controller.qrViewcontroller?.pauseCamera();
                        },
                        child: Text(
                          'Pausar',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(24),
                      child: TextButton(
                        onPressed: () async {
                          await controller.qrViewcontroller?.resumeCamera();
                        },
                        child: Text(
                          'Retomar',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController qrViewController) {
    setState(() {
      this.controller.qrViewcontroller = qrViewController;
    });
    _subscription = qrViewController.scannedDataStream.listen((scanData) {
      setState(() {
        controller.barCodeResult = scanData;
      });
      _subscription.cancel();
      Future.delayed(Duration(seconds: 1), () {
        //TODO go to user data
        navigator.pushVaccine(context);
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sem permissão de câmera')),
      );
    }
  }

  @override
  void dispose() {
    controller.qrViewcontroller?.dispose();
    super.dispose();
  }
}
