import 'package:http/http.dart' as http;
import 'dart:async';

List userDatabase = [];

class Request {
  String username;
  String password;
  
  Request(this.username, this.password);
}

int getResponseCodeFromServer(String url, Request request) {
  return 401;
}

abstract class IUser {
  bool authenticated();
}

class User extends IUser {
  bool authenticated() {
    return false;
  }
}

class AuthUser extends IUser {
  bool authenticated() {
    return false;
  }
}

Stream authStream(String login, String password) async* {
  await getResponseCodeFromServer(
    "https://auth.com",
    Request(login, password)
  );
  
  yield User();
}

const SOME_NUMBER = 12;
Stream<int> ourStream = (() async* {
  yield SOME_NUMBER;
  await Future.delayed(const Duration(seconds: 5));
  yield 5;
  await Future.delayed(const Duration(seconds: 2));
  yield 7;
})();

Future getContent() {
  return Future.delayed(
    const Duration(seconds: 5), 
    () => 'Our content of website which we called from server'
  );
}

Future<int> getValue(int param) {
  if (param != SOME_NUMBER) {
    throw Exception("The numbers are not equal to each other");
  }
  return Future.delayed(const Duration(seconds: 2), () => SOME_NUMBER);
}

Future getRealData(String url) async {
  var data = await http.get(Uri.parse(url)); 
  return Future.value(data.body);
}

/*class User{
  String getUserTitle() => title;
}*/

void main() async {
  /*var content = await getContent();
  print("The page is loading in ... 5 seconds");
  print(content);*/
  
  ourStream.listen(
    (result) {
      print(result);
      if (result == 12) {
        print("Remove user from database");
      }
    },
    onDone: () => print("The stream is done!")
  );
 
  /*getContent().then((content) {
    print("The page is loading in ... 5 seconds");
    print(content);
  });
  
  try {
    getValue(13).then((result) {
      print("The value is faster then the content in ... 2 seconds");
      print(result);
    }).catchError((e) {
      print(e);
    });
  } catch(e) {
    print(e);
  }*/
 
  //print("The real data from server is:");
  //var dataFromRealServer = await getRealData('https://jsonplaceholder.typicode.com/posts');
  
  /*var futureDataFromRealServer = getRealData('https://jsonplaceholder.typicode.com/posts');
  
  futureDataFromRealServer.then((param) {
    print(param);
  });*/
  
  /*List<Map<String, dynamic>> normalList = List<Map<String, dynamic>>.from(jsonDecode(dataFromRealServer));
  
  var firstElement = normalList.first;
  
  try {
    User usr = User(
      int.parse(firstElement['userId'].toString()),
      int.parse(firstElement['id'].toString()),
      firstElement['body'].toString(),
      firstElement['title'].toString(),
    );
    print("The user title as below");
    print(usr.getUserTitle());
  } catch(e) {
    print(e);
  }*/
}