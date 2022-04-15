import 'package:flutter/material.dart';
import 'package:tarea/models/tarea.dart';
import 'package:tarea/services/remote_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarea>? tareas;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();

    getData();
  }

  getData()async{
    tareas = await RemoteService().getTarea();
    if(tareas != null)
    {
      setState((){
        isLoaded = true; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
        backgroundColor: Colors.indigo,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.separated(
          //itemCount: tareas?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tareas![index].title),
              subtitle: Text(tareas![index].dueDate.toString()),
              trailing: tareas![index].isCompleted == 1 ? const Icon(Icons.check,color:Colors.green) : const Icon(Icons.dnd_forwardslash,color: Colors.red,),
              leading: const Icon(Icons.book,
              color: Colors.blue),
              onTap: (){
                Navigator.pushNamed(context,'infopage');
              },
            );
          }, 
          itemCount: tareas?.length?? 0,
          separatorBuilder: (context, index) => const Divider(),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
          ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {       
          Navigator.pushNamed(context,'addpage');
        },

        child: const Icon(
          Icons.add
        )
        
        ),
    );
  }
}