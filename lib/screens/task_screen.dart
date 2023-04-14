import 'package:flutter/material.dart';
import '../widgets/task_lists.dart';
import './add_tasks_screen.dart';
import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasksList = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Banana'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add button',
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTasks((newTask) {
                setState(() {
                  tasksList.add(Task(name: newTask));
                });
                Navigator.pop(context);
              }),
              backgroundColor: Colors.transparent,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,),
                ),
               const SizedBox(
                  height: 20.0,
                ),
                const Text('Todoey', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50.0),),
                Text('${tasksList.length} tasks', style: TextStyle(color: Colors.white, fontSize: 15.0),),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TasksLists(tasks: tasksList),
            ),
          )
        ],
      ),
    );
  }
}

// Widget buildBottomSheet(BuildContext context) {
//   return Container(
//     decoration: const BoxDecoration(
//       color: Colors.green,
//       borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),)
//     ),
//     child: const TasksLists(),
//   );
// }