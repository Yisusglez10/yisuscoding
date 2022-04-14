import 'package:flutter/material.dart';
import 'package:tarea/views/screens.dart';
import 'package:tarea/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tareas',
        theme: AppTheme.lightTheme,
        initialRoute: 'homepage',
        routes: {
          'homepage': (BuildContext context) => const HomePage(), 
          'addpage' : (BuildContext context) => const AddPage(),
          'infopage': (BuildContext context) => const InfoPage(),
        },    
      ),
    );
  }
}
