import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Globales Widget -> beschreibt festgelegte Parameter der App im ganzen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'My App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilder API"),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: Center(child: Image.network('https://picsum.photos/300/200')),
    );
  }
}
