import 'package:flutter/material.dart';
import 'package:sign_in_afcs/src/modules/user/submodules/tasks/presenter/pages/components/show_toast_tasks.dart';

class DialogExample extends StatefulWidget {
  final Function(String) onEdit;
  final String newText;

  const DialogExample({super.key, required this.onEdit, required this.newText});

  @override
  State<DialogExample> createState() => _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  final TextEditingController _newTaskController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _newTaskController.text = widget.newText;
  }

  @override
  void dispose() {
    _newTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Edit Task',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage("assets/pikachu.gif"),
            width: 125,
          ),
          TextFormField(
            controller: _newTaskController,
            //onChanged: (value) => tasksStore.toggleEnableButton(value),

            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 233, 130, 130),
                    fontWeight: FontWeight.w500),
                foregroundColor: const Color.fromARGB(255, 233, 130, 130),
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 233, 130, 130),
                    fontWeight: FontWeight.w500),
                foregroundColor: const Color.fromARGB(255, 233, 130, 130),
              ),
              child: const Text('Edit'),
              onPressed: () {
                widget.onEdit(_newTaskController.text);
                Navigator.of(context).pop();

                ShowToastTaskMessage.showTastMessage(
                    "Task edited successfully!", context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
