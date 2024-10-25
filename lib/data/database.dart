import 'package:hive/hive.dart';

class ToDoDatabae{
  late var todoList=[];

  final _myBox=Hive.box('myBox');

  void createInitialData(){
    List todoList=[
      ["Make tutorial",false],
      ["Do Exercise",false]
    ];
  }
  void loadData(){
    todoList=_myBox.get('TODOLIST');
  }
  void updateDatabase(){
    _myBox.put("TODOLIST", todoList);
  }
}