import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

class CreateTaskPage extends StatefulWidget {
  final User? user;
  const CreateTaskPage({super.key, required this.user});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo ${widget.user?.name}"),
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(248, 160, 222, 1)),
            child: Text(
              "Sidebar",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.task),
            title: const Text('Tasks'),
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
