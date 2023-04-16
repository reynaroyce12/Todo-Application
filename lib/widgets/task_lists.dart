import 'package:flutter/material.dart';
import './each_tasks.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksLists extends StatefulWidget {
  // TasksLists({super.key, required this.tasks});
  //
  // final List<Task> tasks;

  @override
  State<TasksLists> createState() => _TasksListsState();
}

class _TasksListsState extends State<TasksLists> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return EachTask(taskText: taskData.tasksList[index].name, longPressCallback: () {
                taskData.deleteTask(taskData.tasksList[index]);
              },);
            },
            itemCount: taskData.taskCount
        );
      },
    );
  }
}


