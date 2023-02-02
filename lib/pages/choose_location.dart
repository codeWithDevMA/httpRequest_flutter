import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  Widget build(BuildContext context) {
    print('build state running');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blue[900],
          title: const Text('Choose location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            icon: const Icon(Icons.add),
            label: Text('the counter is $counter')));
  }
}
