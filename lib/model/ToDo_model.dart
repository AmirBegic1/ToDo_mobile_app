// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/Task_model.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel = TaskModel(
        "Naslov ${taskList.length}", "detalji za task broj ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}
