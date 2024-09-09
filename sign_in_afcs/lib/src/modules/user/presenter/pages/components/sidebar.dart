import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/authorization_store.dart';

class Sidebar extends StatelessWidget {
  final AuthorizationStore authorizationStore;
  const Sidebar({super.key, required this.authorizationStore});

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
                        arguments: authorizationStore.actualUser)),
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
                        arguments: authorizationStore.actualUser)),
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
