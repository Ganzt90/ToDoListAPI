
import 'package:flutter/material.dart';
import 'package:todolistapi/pages/addpage.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: navigateToAddPage, label: const Text("Add Task")),
    );
  }
  void navigateToAddPage(){
    final route = MaterialPageRoute(builder: (context) => AddTaskPage(),);
    Navigator.push(context, route);
  }
}