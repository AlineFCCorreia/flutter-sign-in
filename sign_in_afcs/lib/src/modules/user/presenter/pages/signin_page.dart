import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SignInPage> {
  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Ola"),
        // ),
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Welcome back",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Text(
            "Enter your credential to login",
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) => TextField(
              onChanged: (value) {
                userStore.username = value;
                //print(userStore.username);
              },
              decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.person)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) => TextField(
              obscureText: true,
              onChanged: (value) {
                userStore.password = value;
                //print(userStore.password);
              },
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.password_rounded),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                if (await userStore.login(
                    userStore.username, userStore.password)) {
                  Modular.to
                      .navigate("/tasks/", arguments: userStore.actualUser);
                }
              },
              //onPressed: () => Modular.to.navigate("/tasks_page/"),
              child: const Text("Login")),
          const SizedBox(
            height: 10,
          ),
          Text.rich(
            TextSpan(
                text: "Forgot Password",
                style: const TextStyle(
                  color: Color.fromRGBO(226, 105, 105, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Modular.to.navigate("/sign_up/")),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Color.fromRGBO(226, 105, 105, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Modular.to.navigate("/sign_up/");
                      }),
              ],
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
