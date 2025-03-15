import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dog_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DogProvider()),
      ],
      child: TotApp(),
    ),
  );
}

class TotApp extends StatelessWidget {
  const TotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOT APP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
