// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_first/add/addTask.dart';
import 'package:todo_app_first/myCheckbox/MyCheckbox.dart';
import 'package:todo_app_first/type/type_card.dart';

class card extends StatelessWidget {
  TypeCard cardData ;
  Function deleteTask ;
  Function taskCheckFun ;
  Function editTask ;

  card(this.cardData,this.deleteTask,this.taskCheckFun,this.editTask);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[100],
      margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyCheckbox(
            ischecked: cardData.isCompleted,
            taskCheckFun: taskCheckFun,
            id: cardData.id
          ),
          Expanded(
            child: Text(
              "${cardData.id}) ${cardData.task} ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[800],
                decoration: (cardData.isCompleted?TextDecoration.lineThrough:TextDecoration.none),
                fontFamily: 'Lobster',
                letterSpacing: 1.0,
                wordSpacing: 2.0
              ),
            ),
          ),
          Text(
                (cardData.isEdited ? "Edited" : ""),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
          SizedBox(width: 14.0,),
          IconButton(
            tooltip: "Delete Task",
            onPressed: (){deleteTask(cardData.id);},
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          SizedBox(width: 10.0,),
          IconButton(
            tooltip: "Edit Task",
            disabledColor: Colors.grey[400],
            onPressed: ()async{
              if(cardData.isCompleted){
                showDialog(context: context, builder: (BuildContext context)=>
                  AlertDialog(
                    content: Text(
                      "Completed Tasks can't be Edited.",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child: Text(
                          "OK",
                        ),
                      )
                    ],
                  )
                );
                return ;
              };
              dynamic task = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> AddTask.withTask(TextEditingController(text: cardData.task),{
                    "title":"Edit Task",
                    "button":"Save"
                  })
                )
              );
               if (task is String) editTask(cardData.id,task);
            },
            icon: Icon(
              Icons.edit,
              color: Colors.amber[700],
            ),
          ),
        ],
      ),
    );
  }
}