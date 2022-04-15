import 'package:flutter/material.dart';
import 'package:tarea/models/global.dart';
import 'package:tarea/models/tarea.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:tarea/views/screens.dart';


class RemoteService
{
  
  Future <List<Tarea>?> postTarea() async{
    var client = http.Client();
    final queryParameters = {
    'token': 'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'title': GlobalData.titleField.text,
    'is_completed':GlobalData.isCompletedField.text,
    'due_date':GlobalData.dueDateField.text,
    'comments': GlobalData.commentsField.text,
    'description':GlobalData.descriptionField.text,
    'tags':GlobalData.taskField.text,
    };
  
    final uri = Uri.http('ecsdevapi.nextline.mx' ,'/vdev/tasks-challenge/tasks', queryParameters);
     final response = await http.post(uri, headers: {
        'Content-Type':' application/x-www-form-urlencoded',
        'Authorization': 'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
      },

    );

    if( response.statusCode == 200 ){
      var json = response.body;
      return getFromJson(json);

    }
  }  
}