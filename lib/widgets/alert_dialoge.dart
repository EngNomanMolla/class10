import 'package:flutter/material.dart';
class CustomAlertDialoge extends StatefulWidget {
  TextEditingController controller;
  VoidCallback onPress;
  CustomAlertDialoge({required this.controller, required this.onPress});

  @override
  State<CustomAlertDialoge> createState() => _CustomAlertDialogeState();
}

class _CustomAlertDialogeState extends State<CustomAlertDialoge> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: 'Enter Name'

        ),

      ),
      actions: [
        ElevatedButton(onPressed: widget.onPress,

            child: Text('Save'))
      ],

    );
  }
}
