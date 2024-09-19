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

  late final _$colorAtom = Atom(name: '_TasksStore.color', context: context);

  @override
  String get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(String value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$greenColorSelectedAtom =
      Atom(name: '_TasksStore.greenColorSelected', context: context);

  @override
  bool get greenColorSelected {
    _$greenColorSelectedAtom.reportRead();
    return super.greenColorSelected;
  }

  @override
  set greenColorSelected(bool value) {
    _$greenColorSelectedAtom.reportWrite(value, super.greenColorSelected, () {
      super.greenColorSelected = value;
    });
  }

  late final _$redColorSelectedAtom =
      Atom(name: '_TasksStore.redColorSelected', context: context);

  @override
  bool get redColorSelected {
    _$redColorSelectedAtom.reportRead();
    return super.redColorSelected;
  }

  @override
  set redColorSelected(bool value) {
    _$redColorSelectedAtom.reportWrite(value, super.redColorSelected, () {
      super.redColorSelected = value;
    });
  }

  late final _$yellowColorSelectedAtom =
      Atom(name: '_TasksStore.yellowColorSelected', context: context);

  @override
  bool get yellowColorSelected {
    _$yellowColorSelectedAtom.reportRead();
    return super.yellowColorSelected;
  }

  @override
  set yellowColorSelected(bool value) {
    _$yellowColorSelectedAtom.reportWrite(value, super.yellowColorSelected, () {
      super.yellowColorSelected = value;
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
  void greenColorButtonSelect() {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.greenColorButtonSelect');
    try {
      return super.greenColorButtonSelect();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void yellowColorButtonSelect() {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.yellowColorButtonSelect');
    try {
      return super.yellowColorButtonSelect();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void redColorButtonSelect() {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.redColorButtonSelect');
    try {
      return super.redColorButtonSelect();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskText: ${taskText},
enableButton: ${enableButton},
color: ${color},
greenColorSelected: ${greenColorSelected},
redColorSelected: ${redColorSelected},
yellowColorSelected: ${yellowColorSelected}
    ''';
  }
}
