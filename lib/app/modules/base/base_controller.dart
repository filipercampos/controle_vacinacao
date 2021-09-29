import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

///Navigator all pages
class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  final pageController = PageController(initialPage: 0);

  @observable
  int _page = 0;

  @action
  void setPage(int value) => _page = value;

  @computed
  int get page => _page;

  @action
  void goHome() {
    setPage(0);
  }
}
