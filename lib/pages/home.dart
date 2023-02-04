import 'package:flutter/material.dart';
import 'package:httprequest/services/world_time.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key,
      required flag,
      required location,
      required apiUrl,
      required time,
      required isnight});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var args = args.isNotempty
        ? args
        : ModalRoute.of(context)?.settings.arguments as WorldTime;
    Color? bgcolor = args.isnight ? Colors.blue : Colors.indigo[700];
    String pn = args.isnight ? "night.png" : "day.png";
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$pn'), fit: BoxFit.cover),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
              child: Column(children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushReplacementNamed(
                          context, '/locations');
                      setState(() {
                        args = {
                          'flag': result['flag'],
                          'location': result['location'],
                          'apiUrl': result['apiUrl'],
                          'time': result['time'],
                          'isnight': result['isnight']
                        } as WorldTime;
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: Text(
                      'edit location',
                      style: TextStyle(color: Colors.grey[300]),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(args.location,
                      style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    args.time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ])
              ])),
        ),
      ),
    );
  }
}
