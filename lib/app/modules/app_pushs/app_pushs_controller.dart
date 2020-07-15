import 'package:mobx/mobx.dart';

part 'app_pushs_controller.g.dart';

class AppPushsController = _AppPushsControllerBase with _$AppPushsController;

abstract class _AppPushsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
