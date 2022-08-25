import 'package:architecture_demos/api_demo/model/task_model.dart';
import 'package:architecture_demos/api_demo/store/task_store.dart';
import 'package:architecture_demos/api_demo/view/task_create_screen.dart';
import 'package:architecture_demos/api_demo/view/task_edit_screen.dart';
import 'package:architecture_demos/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TaskStore _taskStore = TaskStore();
  @override
  void initState() {
    _taskStore.fetchTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            CommonWidgets.PushReplacement(context, const CreateTaskScreen());
          },
          backgroundColor: Colors.brown,
          child: const Icon(Icons.add)),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: dataListView(),
      ),
    );
  }

  Widget dataListView() {
    return Observer(builder: (context) {
      List<Items> taskItems = _taskStore.items;
      return Stack(
        children: [
          _taskStore.taskStatus == TaskStatus.loading
              ? Positioned(child: CommonWidgets.loadingIndicator())
              : taskItems.isEmpty
                  ? const Center(
                      child: Text('No Task Found'),
                    )
                  : ListView.builder(
                      itemCount: taskItems.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.brown[50],
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: ListTile(
                              title: Text(
                                taskItems[index].title.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.brown[500],
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                taskItems[index].completed!
                                    ? 'Completed'
                                    : 'Not Completed',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.brown[200],
                                ),
                              ),
                              leading: IconButton(
                                  onPressed: () {
                                    CommonWidgets.PushReplacement(context,
                                        EditTask(task: taskItems[index]));
                                  },
                                  icon: const Icon(Icons.edit)),
                              trailing: IconButton(
                                  onPressed: () {
                                    _taskStore
                                        .deteleTask(taskItems[index].sUuid);
                                  },
                                  icon: const Icon(Icons.delete))),
                        );
                      },
                    ),
        ],
      );
    });
  }

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Api Exmaple',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
