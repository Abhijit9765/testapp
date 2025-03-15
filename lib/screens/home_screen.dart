import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dog_provider.dart';
import 'dog_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DogProvider>(context, listen: false).loadDogs();
  }

  @override
  Widget build(BuildContext context) {
    final dogProvider = Provider.of<DogProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("TOT APP - Dogs")),
      body: dogProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dogProvider.dogs.length,
              itemBuilder: (context, index) {
                final dog = dogProvider.dogs[index];
                return ListTile(
                  leading: Image.network(dog.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(dog.name),
                  subtitle: Text(dog.breed),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DogDetailScreen(dog: dog),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
