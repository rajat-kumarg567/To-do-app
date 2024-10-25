import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pracitce/data/database.dart';
import 'package:pracitce/util/dialog_box.dart';
import 'package:pracitce/util/todo_tile.dart';

class HomePage extends StatefulWidget {

   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox=Hive.box('myBox');
  final _controller=TextEditingController();
  ToDoDatabae db=ToDoDatabae();

  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }


  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updateDatabase();
  }
  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();

    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO D0',style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: (){
          showDialog(context: context, builder: (context){
            return DialogBox(controller: _controller,
            onSave: saveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),);
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
         itemCount: db.todoList.length,
        itemBuilder: (context,index){
           return TodoTile(
             deleteFunction: (context)=>deleteTask(index),
               onChanged: (value){
                 checkBoxChanged(value,index);
               },
               taskCompleted: db.todoList[index][1],
               taskName: db.todoList[index][0]);
        },

      ),
    );
  }
}
