import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sign_in_afcs/src/modules/user/infra/proto/user.pb.dart';

class TasksPage extends StatefulWidget {
  final User? user;

  const TasksPage({super.key, required this.user});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo ${widget.user?.name}"),
        backgroundColor: const Color.fromRGBO(207, 116, 158, 1),
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.all(0),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(' ${widget.user?.name}\'s Task List',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Observer(
              builder: (_) => TextField(
                onChanged: (value) {
                  // userStore.username = value;
                },
                decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
