import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime  {

  String ? location;
  String ? time;
  String ? flag;
  String ? url;
  bool ? isDayTime;

  WorldTime({ this.location, this.flag, this.url});

  Future<void> getTime() async {
  Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
  Map data = jsonDecode(response.body);
  //print(data);

  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  // print(datetime);
  // print(offset);

  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));

  isDayTime = now.hour > 6 && now.hour > 19 ? false : true ;
  time = DateFormat.jm().format(now);
  }

}