// ignore_for_file: prefer_const_constructors

// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:weatherflut/data/data_const.dart';
import 'package:weatherflut/ui/cities/add/add_city_bloc.dart';
import 'package:weatherflut/ui/commons/header_widget.dart';
import 'package:weatherflut/ui/commons/loader_widget.dart';
import 'package:weatherflut/ui/ui_constansts.dart';
// import 'package:http/http.dart' as http;

class AddCityPage extends StatefulWidget {
  const AddCityPage({Key? key}) : super(key: key);

  @override
  State<AddCityPage> createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  final _bloc = AddCityBloc();

  @override
  Widget build(BuildContext context) {
    //Se usa también para escucha a clases que extienden de changenotifier
    return AnimatedBuilder(
        animation: _bloc,
        builder: (context, child) {
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
                        onChanged: _bloc.onChangedText,
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
                    SizedBox(
                      height: 30,
                    ),
                    // Solution of definition size of widget list cities
                    Expanded(
                      child: ListView.builder(
                        itemCount: _bloc.cities.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          final city = _bloc.cities[index];
                          return ListTile(
                            //Title cities
                            title: Text(
                              city.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            //By icons
                            trailing: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: primaryColor,
                              ),
                              onPressed: () {
                                _bloc.addCity(city);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    if (_bloc.loading)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: LoaderWidget(),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
