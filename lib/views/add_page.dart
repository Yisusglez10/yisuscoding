import 'package:tarea/views/screens.dart';
import 'package:tarea/models/tarea.dart';
import 'package:tarea/services/remote_service_post.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<Tarea>? tareas;

  @override
  void initState(){
    super.initState();
    //postData();
  }

  postData()async{
    tareas = await RemoteService().postTarea();
    if(tareas != null)
    {
      setState((){
      });
    }
  }

  final titleField =  TextEditingController();
  final isCompletedField = TextEditingController();
  final dueDateField =TextEditingController();
  final commentsField =TextEditingController();
  final descriptionField = TextEditingController();
  final taskField = TextEditingController();

  String titF = '';
  String iscF = '';
  String dueF = '';
  String comF = '';
  String desF = '';
  String tasF = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Tarea"),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children:  [

                  TextField(
                    controller: titleField,
                    decoration: (const InputDecoration(
                     labelText:'Title',
                     hintText: 'Task Name',
                      )
                    ),             
                   ),
                  const  SizedBox(height:30),

                  TextField(
                     controller: isCompletedField,
                     decoration: ( const InputDecoration(
                     labelText :'Is Completed',
                     hintText: '0-1',
                     helperText: 'Completed = 1, No Completed = 0',
                     )
                   ),
                  ),
                  const SizedBox(height:30),

                  TextField(
                     controller: dueDateField,
                     decoration: ( const InputDecoration(
                     labelText:'Due Date',
                     hintText: 'YYYY-MM-DD',
                     )
                   ),
                  ),
                  const SizedBox(height:30),

                  TextField(
                    controller: commentsField,
                    decoration: ( const InputDecoration(
                     labelText:'Comments',
                     hintText: 'Task Comments',
                      )
                    ),
                  ),
                  const SizedBox(height:30),

                  TextField(
                     controller: descriptionField,
                     decoration: ( const InputDecoration(
                     labelText:'Description',
                     hintText: 'Task Description',
                   )
                   )
                  ),
                  const SizedBox(height:30),

                  TextField(
                     controller: taskField,
                     decoration: ( const InputDecoration(
                     labelText:'Tags',
                     hintText: 'Task Tags',
                       )
                     )
                  ),            
                  const SizedBox(height:30),

                  ElevatedButton(
                    style:  ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 0,vertical: 15)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                  ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar'))
                    ),         
                    onPressed: () {                  
                    postData();                  
                    Navigator.pushNamed(context,'homepage');
                    },                 
                  )
                  

                  ],
                ) ,
              ),
      )
    );
  }
}

