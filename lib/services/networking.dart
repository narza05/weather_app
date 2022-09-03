import 'dart:convert';
import 'package:http/http.dart' as http;


class networking {
  networking(this.url);
  final String url;

  Future getdata() async {
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      String data = response.body;
      print(response.statusCode);
       return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }
}