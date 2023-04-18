import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class EachTask extends StatefulWidget {
  // bool isChecked;
  final String taskText;
  final VoidCallback longPressCallback;
  EachTask({super.key, required this.taskText, required this.longPressCallback});

  @override
  State<EachTask> createState() => _EachTaskState();
}

class _EachTaskState extends State<EachTask> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.longPressCallback,
      title: Text(widget.taskText,
      style: TextStyle(color: const Color(0XFF2C3333),fontWeight: FontWeight.w600, decoration: isChecked == true ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(activeColor: const Color(0XFF2C3333),value: isChecked, onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },),

    );
  }
}