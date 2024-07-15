import 'package:flutter/material.dart';
import 'package:soko_garden/controller/users.dart';
import 'package:soko_garden/screens/auth/register.dart';
import 'package:flutter/gestures.dart';
import 'package:soko_garden/screens/products.dart';


class Login extends StatefulWidget {
  final VoidCallback onClicked;
  const Login({super.key,  required this.onClicked});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
 
  var username = TextEditingController();
  var password = TextEditingController();
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Log In')),
        automaticallyImplyLeading: false,
        
      ),
      
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: username,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      prefixIcon:  Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter a password';
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
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon:  Icon(Icons.password),
                      ),
                      keyboardType: TextInputType.text,
                      
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter a password';
                        }
                        
                        else{
                          return null;
                        }
                        
                      

                      },
                  ),
                ),

                 


              ],
            )),

        ElevatedButton(
          onPressed: (){
            var isValid =formKey.currentState!.validate();
            if(isValid){
              login(username.text, password.text);
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const Products()));
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
            }

          }, child: const Text('Log In')),

       RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "Dont have an account?"),
                TextSpan(text:' Sign Up', style: const TextStyle(color: Colors.blue), recognizer: TapGestureRecognizer()..onTap = widget.onClicked),

          
                
              ],
            ))


           
        ],),


        
      
      
      
      );
  }
}