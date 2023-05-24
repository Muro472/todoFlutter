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
    [
      "Holovachko",
      "Vasyl",
      false,
      "https://cdn.v-a-c.ru/v-a-c-static/store/setkaimage/4c7fdd79-f812-443b-94ca-5a99dd2441c2/image/769c0f9e172c06259b00845a023b7bc6.jpg",
      "Toyota",
      "Supra",
      ['18:30-22:00'],
    ],
    [
      "Andrii",
      "Miluchenko",
      false,
      "https://s2.stc.all.kpcdn.net/family/wp-content/uploads/2022/02/den-taksista-2022-istoriya-i-tradiczii-mezhdunarodnogo-prazdnika-960-960x540.jpg",
      "Volkswagen",
      "Golf",
      ["8:00-14:00"],
    ],
  ];

  void statusChange(int index) {
    setState(() {
      todoList[index][2] = !todoList[index][2];
    });
  }

  void close(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void saveNewTask(int index) {
    setState(() {
      todoList[index][2] = !todoList[index][2];
    });
    Navigator.of(context).pop();
  }

  void createNewTask(int index) {
    showDialog(
      context: context,
      builder: (constext) {
        return DialogBox(
            onCancel: () => Navigator.of(context).pop(),
            image: todoList[index][3],
            index: index,
            onSave: (index) => saveNewTask(index),
            hours: todoList[index][6],
            carManufacture: todoList[index][4],
            carModel: todoList[index][5],
            isBooked: todoList[index][2]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Your driver'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            image: todoList[index][3],
            taskName: todoList[index][0],
            taskComplete: todoList[index][2],
            onClose: () => createNewTask(index),
          );
        },
      ),
    );
  }
}
