import 'package:flutter/material.dart';

class EachTask extends StatefulWidget {
  bool isChecked;
  final String taskText;
  EachTask({super.key, required this.isChecked, required this.taskText});

  @override
  State<EachTask> createState() => _EachTaskState();
}

class _EachTaskState extends State<EachTask> {

  // bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.taskText,
      style: TextStyle(decoration: widget.isChecked == true ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(value: widget.isChecked, onChanged: (bool? value) {
        setState(() {
          widget.isChecked = value!;
        });
      },),
    );
  }
}