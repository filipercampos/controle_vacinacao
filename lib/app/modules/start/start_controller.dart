import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/modules/start/pages/history/history_controller.dart';
import 'package:controle_vacinacao/app/modules/start/pages/home/home_controller.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'pages/profile/profile_controller.dart';

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

  register() {
    if (!GetIt.I.isRegistered<HomeController>()) {
      GetIt.I.registerSingleton(HomeController());
    }
    if (!GetIt.I.isRegistered<HistoryController>()) {
      GetIt.I.registerSingleton(HistoryController());
    }
    if (!GetIt.I.isRegistered<ProfileController>()) {
      GetIt.I.registerSingleton(ProfileController());
    }
  }

  dispose() {
    GetIt.I.unregister<HomeController>();
    GetIt.I.unregister<HistoryController>();
    GetIt.I.unregister<ProfileController>();
    GetIt.I<AuthRepository>().signOut();
  }

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
