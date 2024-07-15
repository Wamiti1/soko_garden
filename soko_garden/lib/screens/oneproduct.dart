import 'package:flutter/material.dart';
import 'package:soko_garden/controller/products.dart';
import 'package:intl/intl.dart';
import '../api/apilist.dart';

class Oneproduct extends StatefulWidget {
  const Oneproduct({super.key, required this.productId});
  final int productId;
  @override
  State<Oneproduct> createState() => _OneproductState();
}

class _OneproductState extends State<Oneproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Future Builders
      // Snapshot - represents state of the future 
      appBar: AppBar(
        title: const Text('One Product'),
        automaticallyImplyLeading: false,
      ),

      body: FutureBuilder(
        future: getone(widget.productId), 
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            //show loading
          return const CircularProgressIndicator();
      
          }
        else if(snapshot.hasError){
          return Text("Error : ${snapshot.error.toString()}");
        }
        else{


          if(snapshot.hasData){
             var data = snapshot.data;
          //build our UI
          return Column(
            children: [
            Image.network('$api/static/images/${data[5]}'),
            Text(data.toString()),
            Text('Product Name : ${data[2]}'),
            Text('Product Price : ${data[3]}'),
            TextButton.icon(onPressed: (){


            }, label: const Text('Buy'))
      
            ],
      
          );
          }

          else{
            return const Text('No Data Found');
          }
            
         
      
        }
      
        })


    );
  }
}