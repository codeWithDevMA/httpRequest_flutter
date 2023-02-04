import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  bool isnight;
  String apiUrl;
  WorldTime({
    required this.location,
    required this.flag,
    required this.apiUrl,
  })  : time = '',
        isnight = true;

  Future<void> getTime() async {
    //America/New_York
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$apiUrl'));
      Map data = jsonDecode(response.body);
      String datetime = data['utc_datetime'];
      //print(data['utc_datetime']);
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isnight = now.hour < 20 && now.hour > 6 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caght error $e');
      time = 'could not get time data';
    }
  }
}
