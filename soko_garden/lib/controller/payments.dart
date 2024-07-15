import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/apilist.dart';
 
 Future mpesa(double amount, String phone) async{
    try{
      var url = Uri.parse('$api/api/mpesa');
      var body = jsonEncode({
        'amount': amount,
        'phone': phone
      });
      var headers ={"Content-type":"application/json"};

      http.Response response = await http.post(url,body:body, headers:headers);
      if(response.statusCode == 200){
        return jsonDecode(response.body);
      }

    }
    catch(e){
       
         print(e);
        
    
    }



  }