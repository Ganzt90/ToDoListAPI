import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
            TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title'
            ),
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: submitData, child: const Text('Submit data'))
        ],
      ),
    );
  }
  Future<void> submitData() async {
    
    // Get data from Form
    final title = titleController.text; 
    final description = descriptionController.text; 

    final body = {
      "name": title,
      "description": description,
      "isComplete": false
    };
    // Send Data To API
    //const url = 'localhost:5049';
    //var uri = Uri.http(url, '/api/TodoItems');
    //var uri = Uri.http('www.example-api.com:5049', 'api/TodoItems');
    //final response = await http.get(uri);
    //final response = await http.post(uri, body: jsonEncode(body));
    //final response = await http.get(uri);
    
    String url = "http://www.example-api.com:5049/api/TodoItems";
    final response = await http.get(Uri.parse(url), headers: {"Accept":"text/plain"});


    // Show Success or Faile message
    //var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse =  jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(response);
  }
}

