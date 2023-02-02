import 'package:flutter/material.dart';
import 'package:httprequest/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String TimeLoading = 'loading';
  void SetupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: ' newYork.png', location: 'america', apiUrl: 'America/New_York');
    await instance.getTime();
    setState(() {
      TimeLoading = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    SetupWorldTime();
    print('hey there');
    print('initial state running');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(TimeLoading)],
        ),
      ),
    );
  }
}
