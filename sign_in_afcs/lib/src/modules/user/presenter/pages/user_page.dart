import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/authorization/presenter/stores/authorization_store.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/components/sidebar.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserStore userStore;
  late final AuthorizationStore authorizationStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
    authorizationStore = context.read<AuthorizationStore>();
    Modular.to.navigate('/user_module/tasks_module/',
        arguments: authorizationStore.actualUser);
    //userStore.changeRoute('Tasks', 'tasks_module');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   tooltip: 'Voltar para tasks',
        //   icon: const Icon(
        //     Icons.home,
        //   ),
        //   color: const Color.fromARGB(255, 255, 255, 255),
        //   onPressed: () => Modular.to.navigate("/user_module/tasks_module/"),
        // ),

        title: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                const Image(
                  image: AssetImage("assets/pikachu.gif"),
                  width: 125,
                  height: 125,
                ),
                Text("Bem vindo ${authorizationStore.actualUser.name}"),
              ],
            )),

        backgroundColor: const Color.fromARGB(255, 233, 130, 130),
      ),
      body: Row(
        children: [
          Sidebar(authorizationStore: authorizationStore),
          const Expanded(child: RouterOutlet())
        ],
      ),
    );
  }
}
