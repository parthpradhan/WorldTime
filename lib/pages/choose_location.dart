import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',location: 'London',flag: 'uk.jpg',),
    WorldTime(url: 'Asia/Kolkata',location: 'Delhi',flag: 'india.jpg',),
    WorldTime(url: 'Indian/Maldives',location: 'Maldives',flag: 'maldives.jpg',),
    WorldTime(url: 'America/New_York',location: 'New York',flag: 'us.jpg',),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag:'southkorea.jpg'),
    WorldTime(url: 'Antarctica/Casey',location: 'Antarctica',flag:'antarctica.png'),
    WorldTime(url: 'Australia/Sydney',location: 'Sydney',flag:'aus.jpg'),
    WorldTime(url: 'Europe/Moscow',location: 'Moscow',flag:'moscow.jfif'),
  ];
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose a Location'),
        centerTitle: true,
          elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/white.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
