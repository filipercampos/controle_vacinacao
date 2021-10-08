// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrCodeController on _QrCodeControllerBase, Store {
  Computed<String>? _$qrcodeComputed;

  @override
  String get qrcode =>
      (_$qrcodeComputed ??= Computed<String>(() => super.qrcode,
              name: '_QrCodeControllerBase.qrcode'))
          .value;
  Computed<String>? _$barcodeFormatComputed;

  @override
  String get barcodeFormat =>
      (_$barcodeFormatComputed ??= Computed<String>(() => super.barcodeFormat,
              name: '_QrCodeControllerBase.barcodeFormat'))
          .value;

  final _$pauseAtom = Atom(name: '_QrCodeControllerBase.pause');

  @override
  bool get pause {
    _$pauseAtom.reportRead();
    return super.pause;
  }

  @override
  set pause(bool value) {
    _$pauseAtom.reportWrite(value, super.pause, () {
      super.pause = value;
    });
  }

  final _$resumeAtom = Atom(name: '_QrCodeControllerBase.resume');

  @override
  bool get resume {
    _$resumeAtom.reportRead();
    return super.resume;
  }

  @override
  set resume(bool value) {
    _$resumeAtom.reportWrite(value, super.resume, () {
      super.resume = value;
    });
  }

  final _$flashLightAtom = Atom(name: '_QrCodeControllerBase.flashLight');

  @override
  bool get flashLight {
    _$flashLightAtom.reportRead();
    return super.flashLight;
  }

  @override
  set flashLight(bool value) {
    _$flashLightAtom.reportWrite(value, super.flashLight, () {
      super.flashLight = value;
    });
  }

  final _$frontCameraAtom = Atom(name: '_QrCodeControllerBase.frontCamera');

  @override
  bool get frontCamera {
    _$frontCameraAtom.reportRead();
    return super.frontCamera;
  }

  @override
  set frontCamera(bool value) {
    _$frontCameraAtom.reportWrite(value, super.frontCamera, () {
      super.frontCamera = value;
    });
  }

  final _$barCodeResultAtom = Atom(name: '_QrCodeControllerBase.barCodeResult');

  @override
  Barcode? get barCodeResult {
    _$barCodeResultAtom.reportRead();
    return super.barCodeResult;
  }

  @override
  set barCodeResult(Barcode? value) {
    _$barCodeResultAtom.reportWrite(value, super.barCodeResult, () {
      super.barCodeResult = value;
    });
  }

  final _$toogleFlashAsyncAction =
      AsyncAction('_QrCodeControllerBase.toogleFlash');

  @override
  Future<void> toogleFlash() {
    return _$toogleFlashAsyncAction.run(() => super.toogleFlash());
  }

  final _$flipCameraAsyncAction =
      AsyncAction('_QrCodeControllerBase.flipCamera');

  @override
  Future<void> flipCamera() {
    return _$flipCameraAsyncAction.run(() => super.flipCamera());
  }

  @override
  String toString() {
    return '''
pause: ${pause},
resume: ${resume},
flashLight: ${flashLight},
frontCamera: ${frontCamera},
barCodeResult: ${barCodeResult},
qrcode: ${qrcode},
barcodeFormat: ${barcodeFormat}
    ''';
  }
}
