import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late String time;
  String flag;
  String apiUrl;

  WorldTime(
      {required this.location, required this.flag, required this.apiUrl}) {
    time = '';
  }

  Future<void> getTime() async {
    //America/New_York
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$apiUrl'));
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    //print(data['utc_datetime']);
    String offset = data['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = now.toString();
  }
}
