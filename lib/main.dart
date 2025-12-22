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

  //class ChangeURL {

  //}
}

class _HomePageState extends State<HomePage> {
  var imageUrl;
  void loadNewImage() {
    setState(() {
      imageUrl =
          'https://picsum.photos/300?random=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilder API"),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: loadNewImage,
              child: const Text('Neues Bild'),
            ),
          ],
        ),
      ),
    );
  }
}
