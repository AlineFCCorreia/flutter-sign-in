import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/pages/components/edit_box.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/pages/components/show_toast_tasks.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/stores/tasks_store.dart';
import 'package:sign_in_afcs/src/modules/authorization/infra/proto/user.pb.dart';

class TaskPage extends StatefulWidget {
  final User? user;
  const TaskPage({super.key, required this.user});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late final TasksStore tasksStore;

  @override
  void initState() {
    super.initState();
    tasksStore = context.read<TasksStore>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tasksStore.getTask(widget.user!.id);
      //var number = tasksStore.getTaskCount();
      //print(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) => Expanded(
                  child: ListView.builder(
                    itemCount: tasksStore.taskList.length,
                    itemBuilder: (context, index) {
                      final actualTask = tasksStore.taskList[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          duration: const Duration(seconds: 1),
                          verticalOffset: 200.0,
                          child: FadeInAnimation(
                            child: Card(
                              child: ListTile(
                                title: Text(actualTask.task),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            builder: (context) => DialogExample(
                                                  newText: actualTask.task,
                                                  onEdit: (p0) async {
                                                    await tasksStore.editTask(
                                                        actualTask, p0);
                                                    await tasksStore.getTask(
                                                        widget.user!.id);
                                                  },
                                                ));

                                        // await tasksStore.editTask(actualTask.id);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        await tasksStore
                                            .removeTask(actualTask.id);
                                        ShowToastTaskMessage.showTastMessage(
                                            "Task successfully deleted!",
                                            context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed(
                        "/user_module/tasks_module/create_task/",
                        arguments: widget.user);
                  },
                  child: const Text("Create task")),
              const SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
