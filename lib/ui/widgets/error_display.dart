import 'package:flutter/material.dart';
import 'package:hydro_flutter/models/error.dart';
import 'package:hydro_flutter/util/util.dart';

class ErrorDisplay extends StatelessWidget {
  final ErrorStates errorState;
  final String? msg;

  ErrorDisplay({required this.errorState, this.msg});

  IconData get _iconData {
    switch (errorState) {
      case ErrorStates.OFFLINE:
        return Icons.cloud_off;
      case ErrorStates.NONE:
      case ErrorStates.UNKNOWN:
      default:
        return Icons.error;
    }
  }

  String get _msg {
    if (msg is String) {
      return msg ?? '';
    }
    return enumToString(errorState);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _iconData,
          color: Colors.red,
          size: 50,
        ),
        Text(_msg)
      ],
    );
  }
}
