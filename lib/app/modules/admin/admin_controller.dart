import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'admin_controller.g.dart';

class AdminController = _AdminControllerBase with _$AdminController;

abstract class _AdminControllerBase with Store {
  final _auth = GetIt.I.get<AuthRepository>();

  @observable
  bool loading = false;

  UserModel get user => _auth.user;
}
