import 'package:flutter/material.dart';
import 'package:weatherflut/ui/commons/header_widget.dart';
import 'package:weatherflut/ui/ui_constansts.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxPageWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              HeaderWidget(
                title: 'Mis Ciudades',
              )
            ],
          ),
        ),
      ),
    );
  }
}
