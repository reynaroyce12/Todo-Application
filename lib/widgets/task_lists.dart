import 'package:flutter/material.dart';
import './each_tasks.dart';
import '../models/task.dart';

class TasksLists extends StatefulWidget {
  TasksLists({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TasksLists> createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return EachTask(isChecked: widget.tasks[index].isDone, taskText: widget.tasks[index].name);
        },
        itemCount: widget.tasks.length
    );
  }
}


