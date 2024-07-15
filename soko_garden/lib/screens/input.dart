import 'package:flutter/material.dart';
import 'package:soko_garden/screens/auth/register.dart';
import 'package:soko_garden/screens/products.dart';
import '../controller/payments.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  var amount = TextEditingController(text: '20');
  var phoneNumber = TextEditingController(text : '254757693623');
  var formKey = GlobalKey<FormState>();
 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Mpesa Transactions'),
        actions : [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>const Products()));}, icon: const Icon(Icons.shop_outlined)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> const Register()));}, icon: const Icon(Icons.sunny_snowing))
          ]
        ),
        body: Form(
          key: formKey,

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: amount,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                      if(value!.isEmpty || int.tryParse(value) == null){
                        return 'Please enter a valid amount';
                      }
                      else{
                        return null;
                      }
                  },
                ),
              ),

               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: TextFormField(
                    controller: phoneNumber,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    hintText: 'e.g 254736252191',
                    border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value!.isEmpty || int.tryParse(value) == null || value.length < 10){
                      return 'Please enter a valid phone number';
                    }
                    else{
                      return null;
                    }
                 
                  },
                 
                               ),
               ),

              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  try{mpesa(double.tryParse(amount.text)!, phoneNumber.text);}
                  catch(e){
                    if(mounted){
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.toString())));
                    }else{}
                  }
                  
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please check your fields')));
                }

              }, child: const Text('Make payment'))


             ]),
        
        )
    );
  }
}