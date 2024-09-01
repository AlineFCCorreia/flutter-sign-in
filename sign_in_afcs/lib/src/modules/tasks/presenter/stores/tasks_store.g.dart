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

  @override
  String toString() {
    return '''
taskText: ${taskText}
    ''';
  }
}
