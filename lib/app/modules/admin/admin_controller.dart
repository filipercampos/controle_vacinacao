import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'pages/operator/operator_controller.dart';

part 'admin_controller.g.dart';

class AdminController = _AdminControllerBase with _$AdminController;

abstract class _AdminControllerBase with Store {
  final _auth = GetIt.I.get<AuthRepository>();

  UserModel get user => _auth.user;

  void register() {
    if (!GetIt.I.isRegistered<OperatorController>()) {
      GetIt.I.registerSingleton(OperatorController());
    }
  }

  void dispose() {
    GetIt.I.unregister<OperatorController>();
  }
}
