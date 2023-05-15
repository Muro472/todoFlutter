import 'package:flutter/material.dart';
import 'todo_tile.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //default todo tasks

  List todoList = [
    ["LearnReact", false],
    ["LearnReact2", false],
  ];

  void checkBoxChange(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void close(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // text controller

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (constext) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text('Myroslav to do'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todoList[index][0],
              taskComplete: todoList[index][1],
              onChanged: (val) => checkBoxChange(index),
              onClose: () => close(index),
            );
          },
        ));
  }
}
