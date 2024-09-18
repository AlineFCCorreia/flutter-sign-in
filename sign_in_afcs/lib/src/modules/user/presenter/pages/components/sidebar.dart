import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/components/menu_item.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';

class Sidebar extends StatelessWidget {
  final User user;
  final String taskCount;
  const Sidebar({super.key, required this.user, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 75,

        color: const Color.fromARGB(255, 233, 130, 130),
        // alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 5.0),

        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/pikachu.gif"),
              width: 125,
            ),
            const SizedBox(
              height: 25,
            ),
            // InkWell(
            //   borderRadius: BorderRadius.circular(15),
            //   onTap: () {},
            //   child: Observer(builder: (_) {
            //     return const Tooltip(
            //       preferBelow: false,
            //       message: "ola",
            //       //onTriggered: ,
            //       child: Expanded(child: BuildIconItem()),
            //     );
            //   }),
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            Text.rich(
              TextSpan(
                  text: "Perfil",
                  style: const TextStyle(
                    color: Color.fromRGBO(253, 253, 253, 1),
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Modular.to.navigate(
                        "/user_module/profile_module/",
                        arguments: user)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text.rich(
              TextSpan(
                  text: "Tasks",
                  style: const TextStyle(
                    color: Color.fromRGBO(253, 253, 253, 1),
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Modular.to.navigate(
                        "/user_module/tasks_module/",
                        arguments: user)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Text.rich(
              TextSpan(
                  text: "Task Count: $taskCount",
                  style: const TextStyle(
                    color: Color.fromRGBO(253, 253, 253, 1),
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Modular.to.navigate(
                        "/user_module/tasks_module/",
                        arguments: user)),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 25,
            ),
            Text.rich(
              TextSpan(
                  text: "Logout",
                  style: const TextStyle(
                    color: Color.fromRGBO(253, 253, 253, 1),
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Modular.to.navigate(
                          "/",
                        )),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
