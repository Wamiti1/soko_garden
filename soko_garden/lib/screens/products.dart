import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:soko_garden/api/apilist.dart';
import 'package:soko_garden/controller/products.dart';
import 'package:soko_garden/screens/createproduct.dart';
import 'package:soko_garden/screens/oneproduct.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}



class _ProductsState extends State<Products> {
  

  List one = [];
  


  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const Createproduct()));
            }, icon: const Icon(Icons.edit_note)),
          IconButton(onPressed: (){initState();}, icon: const Icon(Icons.refresh)) ],
      ),
       body : FutureBuilder(
        future: 
        getproducts(), 
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }

          
          else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          
          else {
            var data = snapshot.data;
            if(data != null){
              return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                  return ListTile(
                    onTap: (){
                      getone(data[index][0]);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Oneproduct(productId: data[index][0],)));
                      
                    },


                    leading:  SizedBox(
                      height: MediaQuery.of(context).size.height*0.3,
                      child: Image.network("$api/static/images/${data[index][5]}",scale: 2, )),
                  
                    subtitle:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Name : ${data[index][1]}'),
                            Text('Product Description : ${data[index][2]}',overflow: TextOverflow.visible,),
                            Text('Product Price : KSH ${ NumberFormat().format(data[index][3])}'),
                            
                          ],
                ),
            
          
          );
        });
            }
             else{
              return const Text('No products found');
            }
            
            
          }
          




         
          

        
        
        }
        
        ),
       

      

    

 ); }
}