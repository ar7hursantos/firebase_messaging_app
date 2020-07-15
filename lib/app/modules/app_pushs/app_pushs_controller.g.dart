// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_pushs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppPushsController on _AppPushsControllerBase, Store {
  final _$valueAtom = Atom(name: '_AppPushsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_AppPushsControllerBaseActionController =
      ActionController(name: '_AppPushsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AppPushsControllerBaseActionController.startAction(
        name: '_AppPushsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AppPushsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
