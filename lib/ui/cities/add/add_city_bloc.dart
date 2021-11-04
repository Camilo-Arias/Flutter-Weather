import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weatherflut/model/city.dart';
import 'package:weatherflut/ui/commons/debouncer.dart';

class AddCityBloc extends ChangeNotifier {
  final debouncer = Debouncer();
  List<City> cities = [];
  bool loading = false;

  void onChangedText(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) requestSearch(text);
    });
  }

  void requestSearch(String text) async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    // final url = Uri.parse('${api}search/?query=$text');
    // final response = await http.get(url);
    // final data = jsonDecode(utf8.decode(response.bodyBytes)) as List;

    loading = false;
    cities = [City('bogota', 123)];
    // data.map((e) => City.fromJson(e)).toList();
    notifyListeners();
  }

  void addCity(City city) {
    final url = '${api}search/?query?$text';
    final response = await http.get(url);
    final data = jsonDecode(response.body);
  }
}
