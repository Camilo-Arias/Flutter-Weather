// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//Widget what function of router
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //It's a template that has individual elements included such as AppBar among others.
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/welcome.jpg',
            ),
          ),
          //Permite agregar elementos en vertical
          SafeArea(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 200.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Adds an empty box for spacing between elements
                    const SizedBox(
                      height: 35,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Hola,\nBienvenido',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '¿Qué te parece si agregamos\nuna nueva ciudad?',
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    //Button by add citys an the app
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Agregar Ciudad'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
