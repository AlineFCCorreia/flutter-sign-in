import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/pages/components/show_toast_tasks.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/stores/tasks_store.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

class CreateTaskPage extends StatefulWidget {
  final User? user;

  const CreateTaskPage({super.key, required this.user});

  @override
  State<CreateTaskPage> createState() => _CreateTasksPageState();
}

enum PossibleColors { white, red }

class _CreateTasksPageState extends State<CreateTaskPage> {
  late final TasksStore tasksStore;

  final bool selected = false;

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
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Adicionar tarefa"),
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
            Observer(
              builder: (context) => TextFormField(
                controller: _taskController,
                onChanged: (value) => tasksStore.toggleEnableButton(value),
                decoration: const InputDecoration(
                  labelText: "Add task",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (context) => CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: Icon(
                        tasksStore.greenColorSelected ? Icons.check : null,
                        color: Colors.white,
                        size: 12,
                      ),
                      onPressed: () {
                        tasksStore.greenColorButtonSelect();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Observer(
                  builder: (context) => CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.yellow,
                    child: IconButton(
                      icon: Icon(
                        tasksStore.yellowColorSelected ? Icons.check : null,
                        color: Colors.white,
                        size: 12,
                      ),
                      onPressed: () {
                        tasksStore.yellowColorButtonSelect();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Observer(
                    builder: (context) => CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.red,
                          child: IconButton(
                            icon: Icon(
                              tasksStore.redColorSelected ? Icons.check : null,
                              color: Colors.white,
                              size: 12,
                            ),
                            onPressed: () {
                              tasksStore.redColorButtonSelect();
                            },
                          ),
                        ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(
              builder: (context) => ElevatedButton(
                  onPressed: tasksStore.enableButton
                      ? () async {
                          await tasksStore.addTask(
                              _taskController.text, widget.user!.id);
                          _taskController.clear();

                          ShowToastTaskMessage.showTastMessage(
                              "Task successfully added! ", context);
                        }
                      : null,
                  child: const Text('Add task')),
            ),
          ],
        ),
      ),
    );
  }
}
