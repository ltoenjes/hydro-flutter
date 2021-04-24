import 'package:flutter/material.dart';
import 'package:hydro_flutter/pages/livestream.dart';
import 'package:hydro_flutter/pages/sensor_readings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool showLivestreamPage = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Hydro'),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Sensordaten'),
                ),
                Tab(
                  child: Text('Livestream'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SensorReadingsPage(),
              LiveStreamPage(),
            ],
          )),
    );
  }
}
