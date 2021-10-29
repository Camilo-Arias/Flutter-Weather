// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherflut/ui/cities/add/add_city_page.dart';
import 'package:weatherflut/ui/commons/header_widget.dart';
import 'package:weatherflut/ui/ui_constansts.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  void handleNavigationPress(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 600,
        ),
        pageBuilder: (_, animation1, animation2) {
          return SlideTransition(
            //transition new page
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(animation1),
            child: AddCityPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleNavigationPress(context),
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxPageWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              HeaderWidget(
                title: 'Mis Ciudades',
              ),
              Expanded(
                child: Center(
                  child: Text('No tienes ciudades 😭'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
