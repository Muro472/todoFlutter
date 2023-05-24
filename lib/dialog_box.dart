import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  Function(int) onSave;
  VoidCallback onCancel;
  final bool isBooked;
  final int index;
  final String image;
  final String carManufacture;
  final String carModel;
  final List<String> hours;

  DialogBox({
    super.key,
    required this.index,
    required this.onSave,
    required this.isBooked,
    required this.onCancel,
    required this.image,
    required this.hours,
    required this.carManufacture,
    required this.carModel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 300,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image(
            image: NetworkImage(image),
          ),
          Text("Car: " + carManufacture + " " + carModel),
          const Text('Availible hours:'),
          // Card(
          //   child: ListView.builder(
          //     itemCount: hours.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         color: Colors.transparent,
          //         child: Text(hours[index]),
          //       );
          //     },
          //   ),
          // ),
          Container(
            color: Colors.transparent,
            child: Text(hours[0]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isBooked)
                MyButton(
                  text: "Book",
                  onPressed: () => onSave(index),
                ),
              const SizedBox(width: 8),
              MyButton(
                text: "Cancel",
                onPressed: onCancel,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
