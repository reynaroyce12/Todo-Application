import 'package:flutter/material.dart';
import './task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  final List<Task> _tasksList = [Task(name: 'Click the add button to add items and long press on items to delete')];

  //This is a getter function that provides tge read-only version of the tasklist function above which is private
  UnmodifiableListView<Task> get tasksList {
    return UnmodifiableListView(_tasksList);
  }


  int get taskCount{
    return _tasksList.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasksList.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}