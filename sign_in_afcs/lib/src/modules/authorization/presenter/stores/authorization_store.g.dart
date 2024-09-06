// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthorizationStore on _AuthorizationStore, Store {
  late final _$showPasswordAtom =
      Atom(name: '_AuthorizationStore.showPassword', context: context);

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

  late final _$_AuthorizationStoreActionController =
      ActionController(name: '_AuthorizationStore', context: context);

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_AuthorizationStoreActionController.startAction(
        name: '_AuthorizationStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_AuthorizationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword}
    ''';
  }
}
