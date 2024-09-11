// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStore, Store {
  late final _$taskTextAtom =
      Atom(name: '_TasksStore.taskText', context: context);

  @override
  String get taskText {
    _$taskTextAtom.reportRead();
    return super.taskText;
  }

  @override
  set taskText(String value) {
    _$taskTextAtom.reportWrite(value, super.taskText, () {
      super.taskText = value;
    });
  }

  late final _$enableButtonAtom =
      Atom(name: '_TasksStore.enableButton', context: context);

  @override
  bool get enableButton {
    _$enableButtonAtom.reportRead();
    return super.enableButton;
  }

  @override
  set enableButton(bool value) {
    _$enableButtonAtom.reportWrite(value, super.enableButton, () {
      super.enableButton = value;
    });
  }

  late final _$_TasksStoreActionController =
      ActionController(name: '_TasksStore', context: context);

  @override
  void toggleEnableButton(String info) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.toggleEnableButton');
    try {
      return super.toggleEnableButton(info);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskText: ${taskText},
enableButton: ${enableButton}
    ''';
  }
}
