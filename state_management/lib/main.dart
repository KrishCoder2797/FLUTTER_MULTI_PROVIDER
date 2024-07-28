import 'package:flutter/material.dart';
import 'loginscreeen.dart';
//import 'displaydata.dart';
import 'skills.dart';

class EmpData extends InheritedWidget {
  int id;
  String name;
  String userName;
  List skills;

  EmpData({
    super.key,
    required this.id,
    required this.name,
    required this.userName,
    required this.skills,
    required super.child,
  });

  static EmpData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EmpData>()!;
  }

  @override
  bool updateShouldNotify(EmpData oldWidget) {
    return id != oldWidget.id;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EmpData(
        id: 1,
        name: " ",
        userName: " ",
        skills: [],
        child: MaterialApp(
          home: LoginPage(),
          //home: DisplayData(),
          //home: Skills(),
          debugShowCheckedModeBanner: false,
        )
        //debugShowCheckedModeBanner: false,
        //home: LoginPage(),
        );
  }
}
