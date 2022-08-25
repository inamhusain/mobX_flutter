import 'package:architecture_demos/api_demo/view/task_list_screen.dart';
import 'package:architecture_demos/common_widgets.dart';
import 'package:architecture_demos/counter_demo/view/counter_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonWidgets.commonButton(
                onPressed: () {
                  CommonWidgets.NavigatePush(context, const CounterExample());
                },
                buttonTitle: 'Counter demo'),
            CommonWidgets.commonButton(
                onPressed: () {
                  CommonWidgets.NavigatePush(context, TaskListScreen());
                },
                buttonTitle: 'Api demo')
          ],
        ),
      ),
    );
  }
}
