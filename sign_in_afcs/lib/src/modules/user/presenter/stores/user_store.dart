import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/user/infra/socket_client.dart';

part "user_store.g.dart";

// ignore: library_private_types_in_public_api
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  //socket
  final ISocketClient _socketClient;

  _UserStore(this._socketClient);

  @observable
  bool visibleIcon = false;

  @observable
  String taskCountNumber = "";

  @observable
  String title = "";

  String oldRoute = "";

  @action
  void changeRoute(String title, String route) {
    if (route != oldRoute) {
      final beforeTitle = this.title;
      this.title = title;

      final routeName = getRouteNameByNewRoute(route);

      if (beforeTitle.toLowerCase() == 'task') {
        Modular.to.pushNamed(routeName);
      } else {
        Modular.to.pushReplacementNamed(routeName);
      }
    }
  }

  String getRouteNameByNewRoute(String newRoute) {
    final routePath = Modular.to.path;
    final routeSplit = routePath.split('/');
    oldRoute = newRoute;

    if (routeSplit.length <= 3) {
      return '../$newRoute/';
    } else {
      return '../../$newRoute/';
    }
  }

  String nameShortener(String name) {
    String result;
    if (name.length > 10) {
      result = "${name.substring(0, 10)}...";
    } else {
      result = name;
    }
    return result;
  }

  void connectSocket() async {
    await _socketClient.connectToServer();
  }

  Future sendTasktIo(String userId) async {
    print("Entrei no send");
    return _socketClient.emitData("update_request", userId);
  }

  Future getTaskCount() async {
    print("Entrei em getTaskCount");
    final res = _socketClient.listenEvent("update_response", taskCount);
    return res;
  }

  String taskCount(String number) {
    taskCountNumber = number;
    print("Esse aqui oh: $number");
    return number;
  }
}
