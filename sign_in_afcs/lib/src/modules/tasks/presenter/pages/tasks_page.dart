import 'package:flutter/material.dart';
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
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [Text("ola ${widget.user}")],
            )));
  }
}
