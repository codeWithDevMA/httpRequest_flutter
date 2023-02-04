import 'package:flutter/material.dart';
import 'package:httprequest/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: 'newYork.png', location: 'america', apiUrl: 'America/New_York');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': instance.flag,
      'location': instance.location,
      'apiUrl': instance.apiUrl,
      'time': instance.time,
      'isnight': instance.isnight
    }) as WorldTime;
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print('hey there');
    print('initial state running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
