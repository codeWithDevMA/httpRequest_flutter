import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/locations');
              },
              icon: const Icon(Icons.edit_location),
              label: const Text('edit location'))
        ],
      )),
    );
  }
}