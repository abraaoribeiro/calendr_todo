// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_form_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TaskFormController = BindInject(
  (i) => TaskFormController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskFormController on _TaskFormControllerBase, Store {
  final _$valueAtom = Atom(name: '_TaskFormControllerBase.value');

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

  final _$_TaskFormControllerBaseActionController =
      ActionController(name: '_TaskFormControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_TaskFormControllerBaseActionController.startAction(
        name: '_TaskFormControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_TaskFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
