import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:soko_garden/controller/users.dart';
import 'package:soko_garden/screens/auth/login.dart';
import 'package:soko_garden/screens/products.dart';
      
class Register extends StatefulWidget {
  final VoidCallback  onClickedSignup;
  const Register({super.key, required this.onClickedSignup});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Register')),
        automaticallyImplyLeading: false,
       
      ),
      
      body: ListView(
        children:[ Column(
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
                          if(value!.isEmpty || double.tryParse(value) != null){
                            return 'Enter a valid username';
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
                      controller: email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon:  Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value){
                          var validator = EmailValidator.validate('$value');
                          if(!validator){
                            return null;
                          }else{
                            return 'Invalid Email';
                          }
                        
        
                        },
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                        prefixIcon:  Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        validator: (value){
                          if(value!.isEmpty || double.tryParse(value) == null){
                            return 'Enter a valid phone number';
                          }
                          else if(value.length < 12){
                            return 'Password should be at least 12 characters long';
                            
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
                            return 'Enter a valid username';
                          }
                          else if(value.length < 6){
                            return 'Password should be at least 6 characters long';
                            
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
                      controller: confirmpassword,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        border: OutlineInputBorder(),
                        prefixIcon:  Icon(Icons.password),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter a password';
                          }
                          else if(value.length < 6){
                            return 'Password should be at least 6 characters long';
                            
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
                var isValid = formKey.currentState!.validate();
                try{
                if(isValid){
                  try{
                    create(username.text, email.text, phone.text, password.text, confirmpassword.text).then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const Products()));
                    });

                  }
                  catch(e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                  
                }
                }
                catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
        
            }, child: const Text('Register')),

           RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'Already have an account?'),
                TextSpan(text:' Sign In', style: const TextStyle(color: Colors.blue), recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignup),

          
                
              ],
            ))
          ],),
      ]),
      
      
      
      );
  }
}