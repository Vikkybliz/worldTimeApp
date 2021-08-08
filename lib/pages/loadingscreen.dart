import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setWorldTime() async{
    WorldTime example = WorldTime(location: 'Istanbul', flag: 'Europe.png', url: 'Europe/Istanbul');
    await example.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : example.location,
      'time' : example.time,
      'flag' : example.flag,
      'isDayTime' : example.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.blue,
          size: 50,
        ),
      ),
    );
  }
}
