import 'package:flutter/material.dart';
import '../widgets/task_lists.dart';
import '../models/task.dart';
import './task_screen.dart';

class AddTasks extends StatefulWidget {
   AddTasks(this.addTaskCallback, {super.key});

  final Function addTaskCallback;

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  late String newTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Items',textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              onChanged: (value) {
                newTask = value;
              },
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                ),
              ),
            ),

            const SizedBox(
              height: 40.0,
            ),

            TextButton(
              onPressed: () {
                widget.addTaskCallback(newTask);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(10.0),
              ),
              child: const Text('Add', style: TextStyle(color: Colors.white, fontSize: 20.0),),
            )
          ],
        ),
      ),
    );
  }
}
