import 'dart:html';

import 'package:flutter/material.dart';
import 'package:httprequest/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  List<WorldTime> locations = [
    WorldTime(apiUrl: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(apiUrl: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(apiUrl: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(apiUrl: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(apiUrl: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        apiUrl: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(apiUrl: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        apiUrl: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatetime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'flag': instance.flag,
      'location': instance.location,
      'apiUrl': instance.apiUrl,
      'time': instance.time,
      'isnight': instance.isnight
    });
  }

  @override
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
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updatetime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              )),
    );
  }
}
