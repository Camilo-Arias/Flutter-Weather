import 'package:flutter/material.dart';
import 'package:weatherflut/ui/cities/cities_page.dart';
import 'package:weatherflut/ui/ui_constansts.dart';

//Widget what function of router
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void handleNavigationPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const CitiesPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //It's a template that has individual elements included such as AppBar among others.
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              child: Image.asset(
                'assets/welcome.jpg',
              ),
              //Expanded of y background
              fit: BoxFit.fill,
            ),
          ),
          //Permite agregar elementos en vertical
          SafeArea(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: maxPageWidth),
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
                    const Text(
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
                    const Text(
                      '¿Qué te parece si agregamos\nuna nueva ciudad?',
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    //Button by add citys an the app
                    ElevatedButton(
                      onPressed: () => handleNavigationPress(context),
                      child: const Text('Agregar Ciudad'),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
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
