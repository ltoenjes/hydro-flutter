import 'dart:convert';

import 'package:equatable/equatable.dart';

class SensorData extends Equatable {
  final double turbidity;
  final double tds;
  SensorData({
    required this.turbidity,
    required this.tds,
  });

  SensorData copyWith({
    double? turbidity,
    double? tds,
  }) {
    return SensorData(
      turbidity: turbidity ?? this.turbidity,
      tds: tds ?? this.tds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'turbidity': turbidity,
      'tds': tds,
    };
  }

  factory SensorData.fromMap(Map<String, dynamic> map) {
    return SensorData(
      turbidity: map['turbidity'] ?? 0.0,
      tds: map['tds'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [turbidity, tds];
}
