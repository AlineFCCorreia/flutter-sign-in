// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninState on _SigninState, Store {
  late final _$errorGetStateAtom =
      Atom(name: '_SigninState.errorGetState', context: context);

  @override
  String? get errorGetState {
    _$errorGetStateAtom.reportRead();
    return super.errorGetState;
  }

  @override
  set errorGetState(String? value) {
    _$errorGetStateAtom.reportWrite(value, super.errorGetState, () {
      super.errorGetState = value;
    });
  }

  late final _$_SigninStateActionController =
      ActionController(name: '_SigninState', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$_SigninStateActionController.startAction(
        name: '_SigninState.clearError');
    try {
      return super.clearError();
    } finally {
      _$_SigninStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAllError(String message) {
    final _$actionInfo = _$_SigninStateActionController.startAction(
        name: '_SigninState.setAllError');
    try {
      return super.setAllError(message);
    } finally {
      _$_SigninStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorGetState: ${errorGetState}
    ''';
  }
}