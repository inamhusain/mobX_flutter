// ignore_for_file: prefer_const_constructors

import 'package:architecture_demos/api_demo/model/task_model.dart';
import 'package:architecture_demos/api_demo/store/task_store.dart';
import 'package:architecture_demos/api_demo/view/task_list_screen.dart';
import 'package:architecture_demos/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController titleController = TextEditingController();

  final TaskStore _taskStore = TaskStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Container(
          margin: const EdgeInsets.all(15),
          child: Observer(
            builder: (context) {
              return Column(children: [
                CommonWidgets.commonTextField(
                    controller: titleController, lableText: 'Title'),
                taskStatusRadioButton(),
                _taskStore.taskStatus == TaskStatus.loading
                    ? CommonWidgets.loadingIndicator()
                    : CommonWidgets.commonButton(
                        onPressed: () {
                          _taskStore.createTask(
                              context: context,
                              items: Items(
                                title: titleController.text,
                              ));
                        },
                        buttonTitle: 'Create Task'),
              ]);
            },
          )),
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
        'Create Task',
      ),
    );
  }
}
