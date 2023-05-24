import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  final String image;
  VoidCallback onClose;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.image,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: MaterialButton(
        onPressed: onClose,
        child: Container(
          padding: EdgeInsets.all(24),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // task name
            Text(
              taskName,
              style: TextStyle(
                decoration: taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            Image(
              image: NetworkImage(image),
              height: 50,
              width: 50,
            )
          ]),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
