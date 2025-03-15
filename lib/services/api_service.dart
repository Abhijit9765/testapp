import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_model.dart';

class ApiService {
  static const String baseUrl = "https://freetestapi.com/api/v1/dogs";

  Future<List<Dog>> fetchDogs() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Dog.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load dogs");
      }
    } catch (e) {
      throw Exception("Error fetching dogs: $e");
    }
  }
}
