import 'package:flutter/material.dart';
import 'package:weather/services/worldTime.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List <WorldTime> locations  = [
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'assets/turkey.png' ),
    WorldTime(url: 'Europe/London', location: 'Lisbon', flag: 'assets/portugal.png'),
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'assets/cote.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'assets/nigeria.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'assets/illinois.png'),
    WorldTime(url: 'America/Detroit', location: 'Detroit', flag: 'assets/michigan.png'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'assets/usa.png'),
    WorldTime(url: 'Antarctica/Casey', location: 'Casey', flag: 'assets/australia.png'),
    WorldTime(url: 'Antarctica/Vostok', location: 'Vostok', flag: 'assets/russia.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'assets/thailand.png'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'assets/israel.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'assets/united-arab-emirates.png'),
  ];

  void upDateTime(index) async{
    WorldTime example = locations[index];
    await example.getTime();
    Navigator.pop(context, {
      'location' : example.location,
      'time' : example.time,
      'flag' : example.flag,
      'isDayTime' : example.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  upDateTime(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag!),
                ),
              ),
            ),
          );
          },
      )
    );
  }
}
