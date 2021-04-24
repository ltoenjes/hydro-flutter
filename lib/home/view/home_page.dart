import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydro_flutter/app/app.dart';
import 'package:hydro_flutter/home/widgets/avatar.dart';
import 'package:hydro_flutter/pages/livestream.dart';
import 'package:hydro_flutter/pages/sensor_readings.dart';

class HomePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
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
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => BlocProvider.of<AppBloc>(context).add(
                  AppLogoutRequested(),
                ),
              ),
              Avatar(
                photo: user.photo,
                radius: 15,
              )
            ],
          ),
          body: TabBarView(
            children: [
              SensorReadingsPage(),
              LiveStreamPage(),
            ],
          )),
    );
    ;
  }
}
