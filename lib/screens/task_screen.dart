import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
import '../widgets/task_lists.dart';
import './add_tasks_screen.dart';
import 'package:provider/provider.dart';


class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add button',
        backgroundColor: const Color(0XFF0E8388),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTasks(),
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
                    backgroundColor: Color(0XFFF4EEE0),
                    radius: 30.0,
                    child: Icon(Icons.list, size: 30.0, color: Color(0XFF2C3333),),
                ),
               const SizedBox(
                  height: 20.0,
                ),
                const Text('Todoey', style: TextStyle(color: Color(0XFFF4EEE0), fontWeight: FontWeight.w600, fontSize: 50.0),),
                Text('${Provider.of<TaskData>(context).taskCount} tasks', style: const TextStyle(color: Color(0XFFF4EEE0), fontSize: 15.0),),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0XFFF4EEE0),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TasksLists(),
            ),
          )
        ],
      ),
    );
  }
}

