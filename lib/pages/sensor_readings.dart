import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydro_flutter/models/error.dart';
import 'package:hydro_flutter/models/sensor_data.dart';
import 'package:hydro_flutter/ui/widgets/error_display.dart';

class SensorReadingsPage extends StatefulWidget {
  @override
  _SensorReadingsPageState createState() => _SensorReadingsPageState();
}

class _SensorReadingsPageState extends State<SensorReadingsPage>
    with AutomaticKeepAliveClientMixin {
  SensorData? data;
  ErrorStates error = ErrorStates.NONE;
  final Dio dio = GetIt.I<Dio>();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() {
    return dio.get('').then((value) {
      setState(() {
        data = SensorData.fromMap(value.data);
      });
    }).catchError((e) async {
      setState(() {
        if (e is DioError && e.error is SocketException) {
          error = ErrorStates.OFFLINE;
        } else {
          error = ErrorStates.UNKNOWN;
        }
      });
      return null;
    });
  }

  Widget _buildDataPoint(double? value, String name, {String? unit}) {
    return ListTile(
      title:
          Text((value?.toString() ?? '0') + (unit is String ? ' $unit' : '')),
      subtitle: Text(name),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () => _loadData(),
      child: data is SensorData
          ? ListView(
              children: [
                _buildDataPoint(data?.turbidity, 'NTU'),
                _buildDataPoint(data?.tds, 'TDS', unit: 'ppm'),
              ],
            )
          : Center(
              child: error != ErrorStates.NONE
                  ? ErrorDisplay(
                      errorState: error,
                    )
                  : CircularProgressIndicator()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
