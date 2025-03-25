abstract class Service{
  Future<String> getRemoteData();
}

String data = '[{"title":"Mathematics", "type" : "Scientific", "pageCount" : 350, "price" : 500, "coverImage" : "image_url" , "description" : "This book is math book do not mess with it "},{"title":"Java", "type" : "Scientific", "pageCount" : 200, "price" : 300, "coverImage" : "image_url", "description"  : "This book is java book be serious"} ]';

class BookService extends Service{
  @override
  Future<String> getRemoteData()  async{
    await Future.delayed(Duration(seconds: 5));
    return data;
  }
}