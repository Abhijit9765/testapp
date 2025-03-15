import 'package:flutter/material.dart';
import '../models/dog_model.dart';
import '../services/api_service.dart';

class DogProvider extends ChangeNotifier {
  List<Dog> _dogs = [];
  bool _isLoading = false;

  List<Dog> get dogs => _dogs;
  bool get isLoading => _isLoading;

  Future<void> loadDogs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _dogs = await ApiService().fetchDogs();
    } catch (e) {
      print("Error: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
