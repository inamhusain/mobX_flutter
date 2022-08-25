// ignore_for_file: use_build_context_synchronously

import 'package:architecture_demos/api_demo/model/task_model.dart';
import 'package:architecture_demos/api_demo/store/task_store.dart';
import 'package:architecture_demos/api_demo/view/task_list_screen.dart';
import 'package:architecture_demos/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class EditTask extends StatefulWidget {
  EditTask({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Items task;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController titleController = TextEditingController();
  final TaskStore _taskStore = TaskStore();

  @override
  void initState() {
    titleController.text = widget.task.title!;
    _taskStore.selected =
        widget.task.completed! ? 'Completed' : 'Not Completed';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Observer(
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                CommonWidgets.commonTextField(
                    controller: titleController, lableText: 'Title'),
                taskStatusRadioButton(),
                _taskStore.taskStatus == TaskStatus.loading
                    ? CommonWidgets.loadingIndicator()
                    : CommonWidgets.commonButton(
                        onPressed: () {
                          _taskStore.editTask(
                            task: Items(
                                title: titleController.text,
                                sUuid: widget.task.sUuid!),
                            context: context,
                          );
                        },
                        buttonTitle: 'Edit Task'),
              ],
            ),
          );
        },
      ),
    );
  }

  taskStatusRadioButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Observer(
          builder: (context) {
            return Row(
              children: [
                Radio(
                    value: 'Completed',
                    groupValue: _taskStore.selected,
                    onChanged: (String? value) {
                      _taskStore.selected = value!;
                    }),
                const Text('Completed'),
              ],
            );
          },
        ),
        Observer(
          builder: (context) {
            return Row(
              children: [
                Radio(
                    value: 'Not Completed',
                    groupValue: _taskStore.selected,
                    onChanged: (String? value) {
                      _taskStore.selected = value!;
                    }),
                const Text('Not Completed'),
              ],
            );
          },
        )
      ],
    );
  }

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.brown[200],
      elevation: 0,
      title: const Text(
        'Edit Task',
      ),
    );
  }
}
