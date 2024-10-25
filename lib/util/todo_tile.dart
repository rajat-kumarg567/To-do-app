import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   TodoTile({super.key,
     required this.onChanged,
     required this.taskCompleted,
     required this.taskName,
     required this.deleteFunction
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25,left: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
           motion: StretchMotion(),
           children: [
             SlidableAction(onPressed: deleteFunction,
             icon: Icons.delete,
               backgroundColor: Colors.red,
               borderRadius: BorderRadius.circular(12),
             )
           ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              //check box
              Checkbox(value: taskCompleted, onChanged: onChanged),
              Text(taskName,
              style: TextStyle(
                  decoration:
                  taskCompleted?TextDecoration.
                  lineThrough:TextDecoration.none),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20)
        
          ),
        ),
      ),
    );
  }
}
