import 'package:http/http.dart' as http; 
import 'dart:convert';

Future getContent(){

  return Future.delayed(const Duration(seconds : 10), ()=>'Our content of website which we called  form server');
}

Future<int>getValue(){

  const SOME_NUMBER = 12;
  return Future.delayed(const Duration(seconds : 2), ()=>SOME_NUMBER);
}

Future getRealData(String url) async {

  var data = await http.get(Uri.parse(url)); 
  return Future.value(
    data.body
  );
}

class User{

  String getUserTitle()=>title;
}

void main() async{

  print("The real data from server is:");
  var dataFromRealServer = await getRealData('https://jsonplaceholder.typicode.com/posts');
  
  List<Map<String,dynamic>> normalList = List<Map<String,dynamic>>.from(jsonDecode(dataFromRealServer));
  
  var firstElement = normalList.first;
  
  try{
    User usr = User(
      int.parse(firstElement['userId'].toString()),
      int.parse(firstElement['id'].toString()),
      firstElement['body'].toString(),
      firstElement['title'].toString(),
    );
    print("The user title as below");
    print(usr.getUserTitle());
  }catch(e){
    print(e);
  }
 
}