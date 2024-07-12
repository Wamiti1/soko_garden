import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:soko_garden/api/apilist.dart';
import 'package:soko_garden/controller/api.dart';
import 'package:soko_garden/screens/createproduct.dart';
import 'package:soko_garden/screens/oneproduct.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}



class _ProductsState extends State<Products> {
  

  List products =[];
  List one = [];
  Future getproducts() async{
    http.Response response = await http.get(Uri.parse('$api/api/products'));
    if(response.statusCode == 200){
        if(mounted){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Succesful')));
        }
        else{}
        products = jsonDecode(response.body);
    }
  }

  



@override
  void initState() {
    super.initState();
    getproducts();
  }



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
            return Text("${snapshot.error.toString()}");
          }
          
          else{
          if(snapshot.hasData){
            var data = snapshot.data;
            if(data != null){
              return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              getone(products[index][0]);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Oneproduct(productId: products[index][0],)));
              
            },


            leading:  SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: Image.network("$api/static/images/${products[index][5]}",scale: 2, )),
           
            subtitle:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name : ${products[index][1]}'),
                    Text('Product Description : ${products[index][2]}',overflow: TextOverflow.visible,),
                    Text('Product Price : KSH ${ NumberFormat().format(products[index][3])}'),
                    
                  ],
                ),
            
          
          );
        });
            }
            
          }
          else{
              return const Text('No products found');
            }

        }}),
       

      

    

 ); }
}