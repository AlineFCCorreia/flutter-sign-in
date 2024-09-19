import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/pages/components/show_toast_auth.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/signup_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignupStore signupStore;

  @override
  void initState() {
    super.initState();
    signupStore = context.read<SignupStore>();
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ReactionBuilder(
        builder: (context) =>
            reaction((p0) => signupStore.signupState.errorGetState, (p0) {
          if (p0 != null) {
            // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //     content: Text(
            //       'Não foi possível realizar o signup!',
            //       style: TextStyle(color: Color.fromRGBO(248, 122, 122, 1)),
            //     ),
            //     duration: Duration(seconds: 1)));
            ShowToastAuthMessage.showToastMessage(
                "Error in sign up! ", context, true);
          }
        }),
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
                controller: _usernameController,
                onChanged: (value) {},
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
                controller: _passwordController,
                onChanged: (value) {},
                obscureText: signupStore.showPassword ? false : true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(signupStore.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      signupStore.toggleShowPassword();
                    },
                  ),
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_rounded),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) => TextField(
                obscureText: signupStore.showPassword ? false : true,
                controller: _confirmPasswordController,
                onChanged: (value) => signupStore.toggleEnableButton(value),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(signupStore.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      signupStore.toggleShowPassword();
                    },
                  ),
                  labelText: "Confirm Password",
                  prefixIcon: const Icon(Icons.password_rounded),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(
              builder: (context) => ElevatedButton(
                  onPressed: signupStore.enableButton
                      ? () async {
                          signupStore.signupState.clearError();
                          if (await signupStore.signup(
                              _usernameController.text,
                              _passwordController.text,
                              _confirmPasswordController.text)) {
                            Modular.to.navigate("/");
                          } else {
                            signupStore.signupState.setAllError("message");
                          }
                        }
                      : null,
                  child: const Text("Sign up")),
            ),
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
      ),
    ));
  }
}
