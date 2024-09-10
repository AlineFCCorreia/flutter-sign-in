import 'package:mobx/mobx.dart';

part "user_store.g.dart";

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore();

  @observable
  String userTitle = "";

  String nameShortener(String name) {
    String result;
    if (name.length > 10) {
      result = "${name.substring(0, 10)}...";
    } else {
      result = name;
    }
    return result;
  }
}
