// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$userTitleAtom =
      Atom(name: '_ProfileStore.userTitle', context: context);

  @override
  String get userTitle {
    _$userTitleAtom.reportRead();
    return super.userTitle;
  }

  @override
  set userTitle(String value) {
    _$userTitleAtom.reportWrite(value, super.userTitle, () {
      super.userTitle = value;
    });
  }

  @override
  String toString() {
    return '''
userTitle: ${userTitle}
    ''';
  }
}
