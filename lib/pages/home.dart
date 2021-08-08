import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bg = data['isDayTime'] ? 'assets/day.jpg' : 'assets/night.jpg';
    var bgColor = data['isDayTime'] ? Colors.indigoAccent : Colors.black38 ;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'isDayTime' : result['isDayTime'],
                          'flag' : result['flag']
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.white70,),
                    label: Text(
                      'Choose Location',
                          style : TextStyle(
                            color: Colors.white70
                          ),
                    )
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
,                  ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
  }
}
