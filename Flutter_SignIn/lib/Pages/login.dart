import 'package:flutter/material.dart' ;
import 'package:flutter_app/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Pages/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>(); 
  
  Login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Log In Page'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50.0,0,50.0,0.0),
        child: Center(
          
           child:Form(
            key: _formkey,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                
              children: [
                Text(
                      'Log In Page',
                       style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                 SizedBox(height: 50),
                Row(
                  children: [
                    
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        maxLength: 50,
                          controller: _email,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            label: Text('Email Id'),
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200),
                            borderSide: BorderSide(
                              color: Colors.black87,
                            )
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter an Email Id';
                          }
                          if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                            return 'Please Enter a Valid Email Adress';
                          }
                        },
                      )
                    )
                  ],
                ),
                SizedBox(height: 20 ),
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        maxLength: 50,
                        controller: _password,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          label: Text('Password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(200),
                            borderSide: BorderSide(
                              color: Colors.black87,
                              
                            )
                          ),
                          
                        ),
                        obscureText: true,
                        validator: (value) {
                          if(value==null || value.isEmpty){
                            return 'Enter a Password';
                          }
                          if(value.length<5){
                            return 'Enter a password with minimum 5 characters';
                          }
                        },
                      )
                    )
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if(_formkey.currentState!.validate()){
                        try{
                        await Login();
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          
                        );
                        }
                        catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed: ${e.toString()}')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ), 
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        
                      ),
                      ) ,
                  ),
                  
                ),

                SizedBox(height: 20),

                Text('OR'),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ), 
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          
                        ),
                        )
                    ),
                )
              ],
                       ),
           ),
          
        ),
      )
    );
  }
}