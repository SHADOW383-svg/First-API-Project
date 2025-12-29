import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? author;
  String? imageUrl;
  bool isLoading = false;

  Future<void> loadImageFromApi() async {
    setState(() {
      isLoading = true;
    });

    final uri = Uri.https('picsum.photos', '/v2/list', {
      'page': '1',
      'limit': '1',
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      final Map<String, dynamic> firstItem = decodedJson[0];

      setState(() {
        author = firstItem['author'];
        imageUrl = firstItem['download_url'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadImageFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON + HTTP Demo'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),

      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (imageUrl != null)
                    Image.network(
                      imageUrl!,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 12),
                  if (author != null)
                    Text(author!, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: isLoading ? null : loadImageFromApi,
                    child: const Text('Neues Bild laden'),
                  ),
                ],
              ),
      ),
    );
  }
}
