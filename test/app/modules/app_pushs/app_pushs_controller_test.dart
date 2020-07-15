import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:firebase_messaging_app/app/modules/app_pushs/app_pushs_controller.dart';
import 'package:firebase_messaging_app/app/modules/app_pushs/app_pushs_module.dart';

void main() {
  initModule(AppPushsModule());
  // AppPushsController apppushs;
  //
  setUp(() {
    //     apppushs = AppPushsModule.to.get<AppPushsController>();
  });

  group('AppPushsController Test', () {
    //   test("First Test", () {
    //     expect(apppushs, isInstanceOf<AppPushsController>());
    //   });

    //   test("Set Value", () {
    //     expect(apppushs.value, equals(0));
    //     apppushs.increment();
    //     expect(apppushs.value, equals(1));
    //   });
  });
}
