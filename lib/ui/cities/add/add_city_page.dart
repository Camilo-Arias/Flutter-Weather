// ignore_for_file: prefer_const_constructors

// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:weatherflut/data/data_const.dart';
import 'package:weatherflut/model/city.dart';
import 'package:weatherflut/ui/commons/debouncer.dart';
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
  final debouncer = Debouncer();
  List<City> cities = [];
  bool loading = false;

  void onChangedText(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) requestSearch(text);
    });
  }

  void requestSearch(String text) async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    // final url = Uri.parse('${api}search/?query=$text');
    // final response = await http.get(url);
    // final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    setState(() {
      loading = false;
      cities = [City('bogota', 123)];
      // data.map((e) => City.fromJson(e)).toList();
    });
  }

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
                  onChanged: onChangedText,
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
                  itemCount: cities.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    final city = cities[index];
                    return ListTile(
                      //Title cities
                      title: Text(
                        city.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      //By icons
                      trailing: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                    );
                  },
                ),
              ),
              if (loading)
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
  }
}
