import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  VoidCallback onClose;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(children: [
          //checkBox

          Checkbox(
            value: taskComplete,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),

          // task name
          Text(
            taskName,
            style: TextStyle(
              decoration: taskComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          MaterialButton(
            onPressed: onClose,
            child: Icon(Icons.close),
          ),
        ]),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
