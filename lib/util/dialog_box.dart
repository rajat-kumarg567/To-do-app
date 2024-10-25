import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pracitce/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controller,required this.onCancel,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(

        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new note"
              )
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //saved button
                MyButton(
                    text: "Save",
                    onPressed: onSave),

                SizedBox(
                  width: 12,
                ),

                //cancel button
                MyButton(text: "Cancel", onPressed:onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
