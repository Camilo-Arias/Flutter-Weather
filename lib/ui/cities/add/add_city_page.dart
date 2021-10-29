// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weatherflut/ui/commons/header_widget.dart';
import 'package:weatherflut/ui/ui_constansts.dart';

class AddCityPage extends StatelessWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxPageWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HeaderWidget(
                title: 'Agregar Ciudad',
              ),
              SizedBox(
                height: 15,
              ),
              //Widget for border radius of input
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    filled: true,
                    fillColor: inputColor,
                    hintText: 'Buscar Ciudad',
                    //Icon by search input
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
