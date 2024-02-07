import 'dart:convert';
import 'dart:developer';
import 'package:codeprism_test/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:codeprism_test/model_class.dart';

class ApiService {
  

  Future<List<UserModel>> getUserData() async{
    List<UserModel> userData = [];
    try {
      var response = await http.get(Uri.parse(ApiEndPoint().baseUrl));
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        log(body.toString());
        userData = List.from(body.map((data) => UserModel.fromJson(data)));
       
        return userData;
      }
      else{
        log('Error: ${response.statusCode}');
        return [];
      }
      
    } catch (e) {
      log("error:  $e");
    }
    return userData;
  }
}