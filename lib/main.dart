import 'package:flutter/material.dart';
import 'package:httprequest/pages/home.dart';
import 'package:httprequest/pages/choose_location.dart';
import 'package:httprequest/pages/loading.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/loading', routes: {
    '/': (context) => const Home(),
    '/locations': (context) => const ChooseLocation(),
    '/loading': (context) => const Loading()
  }));
}
