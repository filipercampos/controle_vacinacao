import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'control_controller.g.dart';

class ControlController = _ControlControllerBase with _$ControlController;

abstract class _ControlControllerBase with Store {
  final _auth = GetIt.I.get<AuthRepository>();

  UserModel get user => _auth.user;

  void register() {
 
  }

  void dispose() {
  }
}
