import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/pages/components/sidebar.dart';
import 'package:sign_in_afcs/src/modules/user/presenter/stores/user_store.dart';

class UserPage extends StatefulWidget {
  final User user;
  const UserPage({super.key, required this.user});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserStore userStore;

  @override
  void initState() {
    super.initState();
    userStore = context.read<UserStore>();
    Modular.to.navigate('/user_module/tasks_module/', arguments: widget.user);
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
                Text("Bem vindo ${userStore.nameShortener(widget.user.name)}"),
              ],
            )),

        backgroundColor: const Color.fromARGB(255, 233, 130, 130),
      ),
      body: Row(
        children: [
          Sidebar(user: widget.user),
          const Expanded(child: RouterOutlet())
        ],
      ),
    );
  }
}
