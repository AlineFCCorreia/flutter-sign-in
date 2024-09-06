import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/stores/tasks_store.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

class CreateTaskPage extends StatefulWidget {
  final User? user;

  const CreateTaskPage({super.key, required this.user});

  @override
  State<CreateTaskPage> createState() => _CreateTasksPageState();
}

class _CreateTasksPageState extends State<CreateTaskPage> {
  late final TasksStore tasksStore;

  @override
  void initState() {
    super.initState();
    tasksStore = context.read<TasksStore>();
  }

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Voltar para tasks',
          icon: const Icon(
            Icons.home,
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Bem vindo ${widget.user?.name}"),
        backgroundColor: const Color.fromRGBO(207, 116, 158, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(' ${widget.user?.name}\'s Task List',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            //Future<bool?> addTask(String task, String userId) async {

            const SizedBox(height: 24),
            TextFormField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: "Add task",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 40),
                ),
                onPressed: () async {
                  await tasksStore.addTask(
                      _taskController.text, widget.user!.id);
                  print(_taskController.text);
                },
                child: const Text('Add task')),
          ],
        ),
      ),
    );
  }
}
