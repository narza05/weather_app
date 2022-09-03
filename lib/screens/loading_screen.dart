import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocation();
    // fetchAlbum();
  }

  Future<void> getlocation() async {
    WeatherModel weatherdata = WeatherModel();
    var weather = await weatherdata.getlocationweather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weather);
    }));
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: SpinKitDoubleBounce(
           color: Colors.grey,
           size: 100,
         ),
       ),
    );
  }
}
