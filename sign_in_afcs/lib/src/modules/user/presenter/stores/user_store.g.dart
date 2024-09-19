// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$visibleIconAtom =
      Atom(name: '_UserStore.visibleIcon', context: context);

  @override
  bool get visibleIcon {
    _$visibleIconAtom.reportRead();
    return super.visibleIcon;
  }

  @override
  set visibleIcon(bool value) {
    _$visibleIconAtom.reportWrite(value, super.visibleIcon, () {
      super.visibleIcon = value;
    });
  }

  late final _$taskCountNumberAtom =
      Atom(name: '_UserStore.taskCountNumber', context: context);

  @override
  String get taskCountNumber {
    _$taskCountNumberAtom.reportRead();
    return super.taskCountNumber;
  }

  @override
  set taskCountNumber(String value) {
    _$taskCountNumberAtom.reportWrite(value, super.taskCountNumber, () {
      super.taskCountNumber = value;
    });
  }

  late final _$titleAtom = Atom(name: '_UserStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void changeRoute(String title, String route) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.changeRoute');
    try {
      return super.changeRoute(title, route);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibleIcon: ${visibleIcon},
taskCountNumber: ${taskCountNumber},
title: ${title}
    ''';
  }
}
