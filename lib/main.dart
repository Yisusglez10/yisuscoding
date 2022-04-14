import 'package:flutter/material.dart';
import 'package:tarea/views/screens.dart';
import 'package:tarea/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tareas',
      theme: AppTheme.lightTheme,
      initialRoute: 'homepage',
      routes: {
        'homepage': (BuildContext context) => HomePage(), 
        'addpage' : (BuildContext context) => AddPage(),
      },    
    );
  }
}
