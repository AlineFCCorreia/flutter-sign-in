// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninStore on _SigninStore, Store {
  late final _$showPasswordAtom =
      Atom(name: '_SigninStore.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$enableButtonAtom =
      Atom(name: '_SigninStore.enableButton', context: context);

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

  late final _$_SigninStoreActionController =
      ActionController(name: '_SigninStore', context: context);

  @override
  void toggleEnableButton(String info) {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.toggleEnableButton');
    try {
      return super.toggleEnableButton(info);
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_SigninStoreActionController.startAction(
        name: '_SigninStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_SigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
enableButton: ${enableButton}
    ''';
  }
}
