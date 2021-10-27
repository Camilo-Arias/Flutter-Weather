import 'package:flutter/material.dart';

//Widget what function of router
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment : CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/logo.png', 
          height: 50,),
        ],
      ),
    );
  }
}