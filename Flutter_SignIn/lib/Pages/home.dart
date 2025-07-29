import 'package:flutter/material.dart' ;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Home Page'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.fromLTRB(50,350,10,100),
      child: Text(
          'You have Signed In Sucessfulyy!!!',
          style: TextStyle(
            fontSize: 20,
            
          ),
          ),
      )
        
       
      
    );
  }
}