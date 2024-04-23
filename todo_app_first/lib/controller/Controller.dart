import 'package:get/get.dart';
import 'package:todo_app_first/Home.dart';
import 'package:todo_app_first/type/type_card.dart';

class Controller extends GetxController{

  static int counter = 1;

  List<TypeCard> localStore = [
    TypeCard(id: Controller.counter++ ,task: "Exercise for 30 minutes in the morning."),
    TypeCard(id: Controller.counter++ ,task: "Mail to the client for updated UI."),
    TypeCard(id: Controller.counter++ ,task: "Order neccessary grocery online ."),
    TypeCard(id: Controller.counter++ ,task: "Complete 2 incidents today."),
    TypeCard(id: Controller.counter++ ,task: "Play Badminton in the evening."),
    
  ];

  void addTask(String task){
    
      localStore.add(TypeCard(id: Controller.counter++, task: task));
    // for(var e in localStore) print(e.task);
  }

  void deleteTask(int id){
    
       localStore.removeWhere((element) => element.id == id);
   
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
      
        localStore.add(t.copyWith(task: task,isEdited: true));
        localStore.remove(t);
      
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
      
        localStore.add(t.copyWith(isCompleted: true));
        localStore.remove(t);
    
      // print("inside if : curr-> $curr and id-> $id");
    }else{
      
        localStore.add(t.copyWith(isCompleted: false));
        localStore.remove(t);
    
      // print("inside else : curr-> $curr and id-> $id");
    }
  }

}