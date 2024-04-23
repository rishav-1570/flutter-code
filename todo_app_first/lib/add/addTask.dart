import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AddTask extends StatelessWidget {

  TextEditingController task = TextEditingController();
  Map<String,String> editTerms = {};

  AddTask();
  AddTask.withTask(this.task,this.editTerms);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              Text(
                editTerms['title'] ?? 'Add Task',
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  fontFamily: 'Orbitron',
                  letterSpacing: 3.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.task_rounded),
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  hintText: "What's your next task ...",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  )
                ),
                validator: (value) {
                  if(value!.isEmpty)
                    return "Task can't be empty!";
                  else 
                    return null;
                },
                controller: task,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  task.text = value!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  if(!task.text.isEmpty){
                    Navigator.pop(context, task.text);
                  }else{
                    showDialog(context: context, builder: (BuildContext context)=>
                      AlertDialog(
                        content: Text(
                          "Task can't be empty.",
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
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.green[900],
                ),
                child: Text(
                  editTerms['button'] ?? "ADD ->",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Orbitron',
                    letterSpacing: 3.0,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}