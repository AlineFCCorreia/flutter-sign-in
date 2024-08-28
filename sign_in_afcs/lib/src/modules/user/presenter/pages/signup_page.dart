import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const TextField(
            decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: Icon(Icons.person)),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.password_rounded),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Confirm Password",
              prefixIcon: Icon(Icons.password_rounded),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                await userStore.signup(userStore.username, userStore.password);
                Modular.to.navigate("/");
              },
              child: const Text("Sign up")),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Or",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {}, child: const Text("Sign In with Google")),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: Color.fromRGBO(226, 105, 105, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Modular.to.navigate("/");
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
