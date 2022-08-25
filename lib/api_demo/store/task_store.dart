import 'package:architecture_demos/api_demo/model/task_model.dart';
import 'package:architecture_demos/api_demo/service/api_service.dart';
import 'package:architecture_demos/api_demo/view/task_list_screen.dart';
import 'package:architecture_demos/common_widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'task_store.g.dart';

class TaskStore = BaseTask with _$TaskStore;

enum TaskStatus { loading, completed }

abstract class BaseTask with Store {
  @observable
  List<Items> items = [];
  @observable
  TaskStatus taskStatus = TaskStatus.completed;
  @observable
  String selected = 'Not Completed';

  @action
  fetchTask() async {
    taskStatus = TaskStatus.loading;
    items = await ApiServices.fetchAllTask();
    taskStatus = TaskStatus.completed;
  }

  @action
  editTask({context, required Items task}) async {
    taskStatus = TaskStatus.loading;
    int statusCode = await ApiServices.editTask(
        uuid: task.sUuid!,
        title: task.title!,
        taskStatus: selected == 'Not Completed' ? false : true);
    if (statusCode == 200) {
      taskStatus = TaskStatus.completed;
      CommonWidgets.PushReplacement(context, const TaskListScreen());
    }
  }

  @action
  createTask({context, required Items items}) async {
    taskStatus = TaskStatus.loading;
    int statusCode = await ApiServices.createTask(
        title: items.title!,
        taskStatus: selected == 'Not Completed' ? false : true);
    if (statusCode == 201) {
      taskStatus = TaskStatus.completed;
      CommonWidgets.PushReplacement(context, const TaskListScreen());
    }
  }

  @action
  deteleTask(uuid) async {
    taskStatus = TaskStatus.loading;
    await ApiServices.deleteTask(uuid: uuid);
    await fetchTask();
  }
}
