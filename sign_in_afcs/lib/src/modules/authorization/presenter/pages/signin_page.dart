import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/signin_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SignInPage> {
  late final SigninStore signinStore;

  @override
  void initState() {
    super.initState();
    signinStore = context.read<SigninStore>();
  }

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ReactionBuilder(
        builder: (context) =>
            reaction((p0) => signinStore.signinState.errorGetState, (p0) {
          if (p0 != null) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'Senha ou usuário incorretos!',
                  style: TextStyle(color: Color.fromRGBO(248, 122, 122, 1)),
                ),
                duration: Duration(seconds: 1)));
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
            TextField(
              controller: _userNameController,
              onChanged: (value) {},
              decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) => TextField(
                obscureText: signinStore.showPassword ? false : true,
                controller: _passwordController,
                onChanged: (value) => signinStore.toggleEnableButton(value),
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(signinStore.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      signinStore.toggleShowPassword();
                    },
                  ),
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
                  onPressed: signinStore.enableButton
                      ? () async {
                          signinStore.signinState.clearError();
                          if (await signinStore.login(_userNameController.text,
                              _passwordController.text)) {
                            Modular.to.navigate("/user_module/",
                                arguments: signinStore.actualUser);
                          } else {
                            signinStore.signinState.setAllError("message");
                          }
                        }
                      : null,
                  //onPressed: () => Modular.to.navigate("/tasks_page/"),
                  child: const Text("Login")),
            ),
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
      ),
    ));
  }
}
