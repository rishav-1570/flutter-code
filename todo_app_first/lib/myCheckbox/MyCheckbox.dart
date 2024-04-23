import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  bool ischecked = false ;
  int id ;
  Function taskCheckFun ;

  MyCheckbox({this.ischecked=false , required this.id, required this.taskCheckFun });

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {

  bool ischecked = false ;

  @override
  void didUpdateWidget(covariant MyCheckbox oldWidget) {
    // TODO: implement didUpdateWidget
    ischecked = widget.ischecked;
  }

  @override
  void initState() {
    // TODO: implement initState
    
    ischecked = widget.ischecked;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: ischecked, 
      onChanged: (bool? curr){
        if(curr!=null){
          setState(() {
            ischecked = curr;
          });
          // print("checkboxfun");
          widget.taskCheckFun(widget.id,curr);
          
        }
    });
  }
}