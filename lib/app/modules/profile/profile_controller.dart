import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final _auth = GetIt.I.get<AuthRepository>();

  @observable
  bool loading = false;

  UserModel get user => _auth.user;
}
