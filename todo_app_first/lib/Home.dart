import 'package:flutter/material.dart';
import 'package:todo_app_first/add/addTask.dart';
import 'package:todo_app_first/card/card.dart';
import 'package:todo_app_first/type/type_card.dart';

class Home extends StatefulWidget {
  static int counter = 1;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TypeCard> localStore = [
    TypeCard(id: Home.counter++ ,task: "Exercise for 30 minutes in the morning."),
    TypeCard(id: Home.counter++ ,task: "Mail to the client for updated UI."),
    TypeCard(id: Home.counter++ ,task: "Order neccessary grocery online ."),
    TypeCard(id: Home.counter++ ,task: "Complete 2 incidents today."),
    TypeCard(id: Home.counter++ ,task: "Play Badminton in the evening."),
    
  ];

  void addTask(String task){
    setState(() {
      localStore.add(TypeCard(id: Home.counter++, task: task));
    });
    // for(var e in localStore) print(e.task);
  }

  void deleteTask(int id){
    setState(() {
       localStore.removeWhere((element) => element.id == id);
    });
    // for(var e in localStore) print(e.task);
  }

  void editTask(int id,String task){
    TypeCard t=localStore[0];
    for(TypeCard e in localStore){
      if(e.id == id){
        t=e;
      }
    }

    if(!task.isEmpty){
      setState(() {
        localStore.add(t.copyWith(task: task,isEdited: true));
        localStore.remove(t);
      });
    }

  }

  void taskChecked(int id, bool curr){
    // print("curr-> $curr and id-> $id");
    TypeCard t=localStore[0];
    for(TypeCard e in localStore){
      if(e.id == id){
        t=e;
      }
    }
    
    if(curr){
      setState(() {
        localStore.add(t.copyWith(isCompleted: true));
        localStore.remove(t);
      });
      // print("inside if : curr-> $curr and id-> $id");
    }else{
      setState(() {
        localStore.add(t.copyWith(isCompleted: false));
        localStore.remove(t);
      });
      // print("inside else : curr-> $curr and id-> $id");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Center(
          child: Text(
            "To - Do App",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Orbitron'
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListView(
                shrinkWrap: true,
                children: localStore.where((e) => e.isCompleted==false).map((e) => card(e,deleteTask,taskChecked,editTask)).toList().reversed.toList()),
          Divider(),
          ListView(
                shrinkWrap: true,
                children: localStore.where((e) => e.isCompleted==true).map((e) => card(e,deleteTask,taskChecked,editTask)).toList().reversed.toList(),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          dynamic task = await Navigator.pushNamed(context, '/Add');
          if (task is String) addTask(task);
        },
        backgroundColor: Colors.blue[300],
        child: Icon(
          Icons.add,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}