import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
part 'qrcode_controller.g.dart';

class QrCodeController = _QrCodeControllerBase with _$QrCodeController;

abstract class _QrCodeControllerBase with Store {
  QRViewController? qrViewcontroller;
  @observable
  bool pause = false;
  @observable
  bool resume = false;
  @observable
  bool flashLight = false;
  @observable
  bool frontCamera = false;
  @observable
  Barcode? barCodeResult;

  @computed
  String get qrcode {
    if (barCodeResult != null)
      return '${describeEnum(barCodeResult!.format)} identificado \n${barCodeResult!.code}';
    return '';
  }

  @computed
  String get barcodeFormat {
    if (barCodeResult != null)
      return 'Barcode Type: ${describeEnum(barCodeResult!.format)}\n${barCodeResult!.code}';
    return '';
  }

  @action
  Future<void> toogleFlash() async {
    await qrViewcontroller?.toggleFlash();
    flashLight = (await qrViewcontroller?.getFlashStatus()) ?? false;
  }

  @action
  Future<void> flipCamera() async {
    await qrViewcontroller?.flipCamera();
    final flip = await qrViewcontroller?.getCameraInfo();
    frontCamera = describeEnum(flip!) != 'back';
  }
}
