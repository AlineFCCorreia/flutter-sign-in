import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/main_app.dart';
import 'package:sign_in_afcs/src/modules/authorization/authorization_module.dart';

void main() {
  runApp(ModularApp(module: AuthorizationModule(), child: const MainApp()));
}
