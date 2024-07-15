import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soko_garden/api/apilist.dart';


//Future for creating users
//Requires a username, email, phone, password, confirm_password

Future create(String username, String email, String phone, String password, String confirmpassword)async {
  try{

var url = Uri.parse("$api/signup");
var headers = {
  "Content-Type":"application/json"
};
var body = jsonEncode({
  "username": username,
  "email":email,
  "phone":phone,
  "password1":password,
  "password2":confirmpassword
});

http.Response response = await http.post(url,headers: headers, body: body);
if(response.statusCode == 200){
  return jsonDecode(response.body);
}

else{
  throw Exception('Failed to create user: ${response.statusCode} - ${response.body}');                                                                              
}
  }
  catch(e){
    print(e);
  } 
}



//Future for Login
//Requires username, password

Future login(String username, String password, )async {
  try{

var url = Uri.parse("$api/login");
var headers = {
  "Content-Type":"application/json"
};
var body = jsonEncode({
  "username": username,
  "password":password,
  
});

http.Response response = await http.post(url,headers: headers, body: body);
if(response.statusCode == 200){
  return jsonDecode(response.body);
}

else{
  throw Exception('Failed to create user: ${response.statusCode} - ${response.body}');                                                                              
}
  }
  catch(e){
    print(e);
  } 
}

