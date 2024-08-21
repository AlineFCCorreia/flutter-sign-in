import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Welcome back",
              style: TextStyle( fontSize: 20,
              fontWeight: FontWeight.bold),
              ),
              Text("Enter your credential to login",
              style: TextStyle(fontSize: 10),
              )
            ],
            
            
            ),
        )
        
      




    );
  }
}
