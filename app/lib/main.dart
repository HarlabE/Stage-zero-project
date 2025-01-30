import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Uri _githubUrl = Uri.parse("https://github.com/HarlabE/Stage-zero-project");
  final Uri _hngHireUrl = Uri.parse("https://hng.tech/hire/flutter-developers");
  final Uri _telexUrl = Uri.parse("https://telex.hng.tech");
  final Uri _delveUrl = Uri.parse("https://delve.hng.tech");

  HomeScreen({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Flutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchUrl(_githubUrl),
              child: const Text("GitHub Repository"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchUrl(_hngHireUrl),
              child: const Text("HNG Hire - Flutter Developers"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchUrl(_telexUrl),
              child: const Text("Telex"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _launchUrl(_delveUrl),
              child: const Text("Delve"),
            ),
          ],
        ),
      ),
    );
  }
}
