import 'dart:convert';
import 'package:flutter_app_2/domain/entities/data_item.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  Future<List<DataItem>> fetchData() async {
    const String apiUrl = 'https://catfact.ninja/fact';
    const int numberOfFacts = 10;

    List<DataItem> catFacts = [];

    for (int i = 0; i < numberOfFacts; i++) {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        catFacts.add(DataItem.fromJson(jsonData));
      } else {
        throw Exception('Failed to load cat fact');
      }
    }

    return catFacts;
  }
}
