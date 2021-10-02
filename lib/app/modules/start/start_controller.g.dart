// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StartController on _StartControllerBase, Store {
  Computed<int>? _$pageComputed;

  @override
  int get page => (_$pageComputed ??=
          Computed<int>(() => super.page, name: '_StartControllerBase.page'))
      .value;

  final _$_pageAtom = Atom(name: '_StartControllerBase._page');

  @override
  int get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  final _$_StartControllerBaseActionController =
      ActionController(name: '_StartControllerBase');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goHome() {
    final _$actionInfo = _$_StartControllerBaseActionController.startAction(
        name: '_StartControllerBase.goHome');
    try {
      return super.goHome();
    } finally {
      _$_StartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
