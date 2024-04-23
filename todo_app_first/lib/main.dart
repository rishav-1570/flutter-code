import 'package:flutter/material.dart';
import 'package:todo_app_first/add/addTask.dart';
import 'package:get/get.dart';
import 'Home.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'To-Do App',
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/Add':(context) => AddTask(),
    },
    // home: Home(),
  ));
}

