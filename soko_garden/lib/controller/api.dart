import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soko_garden/api/apilist.dart';
import 'package:flutter/material.dart';

Future getoneproduct(int id, BuildContext context) async{
    try{
      http.Response feedback = await http.get(Uri.parse('$api/api/single_item/$id'));
    if(feedback.statusCode == 200){
      
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Succesful')));
      
      
      return jsonDecode(feedback.body);
  }
    }
    catch(e){
     
         ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:  Text(e.toString())));
      
      
    }
  
  
  }

  Future getone(int id)async {
    try {
      var body = jsonEncode({
        "id":id
      });
    var url = Uri.parse('$api/single_item');
    var headers = {
      "Content-type":"application/json"
    };


      http.Response response = await http.post(url,body:body, headers:headers);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      return null;
    }

    }

    catch (e){
      print(e);
    }
  }



