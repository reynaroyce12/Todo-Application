import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import '../widgets/task_lists.dart';
import '../models/task.dart';
import './task_screen.dart';

class AddTasks extends StatefulWidget {

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  late String newTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0XFFF4EEE0),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Add Items',textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Color(0Xff2C3333), fontWeight: FontWeight.w700),),

            const SizedBox(
              height: 20.0,
            ),

            TextField(
              onChanged: (value) {
                newTask = value;
              },
              style: const TextStyle(color: Color(0xff2C3333), fontWeight: FontWeight.w600),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF2C3333), width: 3.0),

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF2C3333), width: 3.0),
                ),
              ),
            ),

            const SizedBox(
              height: 40.0,
            ),

            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTask);     //The listen parameter is given as false to only pass the final value and not update after each change
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF0E8388),
                  padding: const EdgeInsets.all(10.0),
              ),
              child: const Text('Add', style: TextStyle(color: Color(0XFF2C3333), fontSize: 20.0),),
            )
          ],
        ),
      ),
    );
  }
}
