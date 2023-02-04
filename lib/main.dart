import 'package:flutter/material.dart';
import 'package:httprequest/pages/home.dart';
import 'package:httprequest/pages/choose_location.dart';
import 'package:httprequest/pages/loading.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/loading', routes: {
      '/': (context) => const Home(),
      '/locations': (context) => const ChooseLocation(),
      '/loading': (context) => const Loading()
    });
  }
}
