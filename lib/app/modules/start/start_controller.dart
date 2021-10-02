import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'start_controller.g.dart';

///Navigator all pages
class StartController = _StartControllerBase with _$StartController;

abstract class _StartControllerBase with Store {
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

  String get initialModule {
    final auth = GetIt.I.get<AuthRepository>();
    if (auth.isAuth) {
      if (auth.isAdmin) {
        return AppPages.ADMIN;
      }
      if (auth.isOperator) {
        return AppPages.CONTROL;
      }
      return AppPages.START;
    } else {
      return AppPages.LOGIN;
    }
  }
}
