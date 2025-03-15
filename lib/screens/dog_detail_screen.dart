import 'package:flutter/material.dart';
import '../models/dog_model.dart';

class DogDetailScreen extends StatelessWidget {
  final Dog dog;

  DogDetailScreen({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dog.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  Image.network(dog.imageUrl, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Text("Breed: ${dog.breed}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (dog.breedGroup != null) Text("Breed Group: ${dog.breedGroup}"),
            if (dog.description != null)
              Text("Description: ${dog.description}"),
          ],
        ),
      ),
    );
  }
}
