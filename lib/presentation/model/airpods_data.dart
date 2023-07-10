import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_airpods/models/device_motion_data.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

@immutable
class AirpodsData {
  const AirpodsData(
    this.deviceMotionStream,
    this.socket,
  );

  final StreamController<DeviceMotionData> deviceMotionStream;
  final io.Socket? socket;

  AirpodsData copyWith({
    io.Socket? socket,
    StreamController<DeviceMotionData>? deviceMotionStream,
  }) {
    return AirpodsData(
      deviceMotionStream ?? this.deviceMotionStream,
      socket ?? this.socket,
    );
  }
}
