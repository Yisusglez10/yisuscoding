import 'package:tarea/models/tarea.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  
  Future <List<Tarea>?> getTarea() async{
    var client = http.Client();

    final queryParameters = {
    'token': 'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
    'title': '',
    'is_completed':'',
    'due_date':'',
    'comments':'',
    'description':'',
    'tags':'',
    };
  
    final uri = Uri.http('ecsdevapi.nextline.mx' ,'/vdev/tasks-challenge/tasks', queryParameters);
     final response = await http.get(uri, headers: {
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