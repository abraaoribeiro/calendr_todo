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
  final _$taskAtom = Atom(name: '_TaskFormControllerBase.task');

  @override
  Task get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Task value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  final _$contactsAtom = Atom(name: '_TaskFormControllerBase.contacts');

  @override
  Iterable<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(Iterable<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  @override
  String toString() {
    return '''
task: ${task},
contacts: ${contacts}
    ''';
  }
}
