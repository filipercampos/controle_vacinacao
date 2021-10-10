import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/modules/control/repositories/vaccine_repository.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final _auth = GetIt.I.get<AuthRepository>();
  final _vacineRepository = VaccineRepository();
  ObservableList<Vaccine> vaccines = ObservableList();

  @observable
  bool loading = false;

  Future<void> fetchHistory() async {
    if (vaccines.length > 0) return;
    try {
      loading = true;
      vaccines =
          (await _vacineRepository.getAllByUser(_auth.user.id)).asObservable();
    } catch (err) {} finally {
      loading = false;
    }
  }
}
