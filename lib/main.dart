import 'package:flutter/material.dart';
import 'package:todolistapi/pages/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List Using API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ToDoListPage(),
    );
  }
}

