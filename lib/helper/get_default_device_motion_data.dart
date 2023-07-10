import 'package:flutter_airpods/models/attitude.dart';
import 'package:flutter_airpods/models/calibrated_magnetic_field.dart';
import 'package:flutter_airpods/models/calibrated_magnetic_field_accuracy.dart';
import 'package:flutter_airpods/models/device_motion_data.dart';
import 'package:flutter_airpods/models/gravity.dart';
import 'package:flutter_airpods/models/magnetic_field.dart';
import 'package:flutter_airpods/models/quaternion.dart';
import 'package:flutter_airpods/models/rotation_rate.dart';
import 'package:flutter_airpods/models/user_acceleration.dart';

DeviceMotionData getDefaultDeviceMotionData() => const DeviceMotionData(
      Attitude(Quaternion(0, 0, 0, 0), 0, 0, 0),
      Gravity(0, 0, 0),
      RotationRate(0, 0, 0),
      UserAcceleration(0, 0, 0),
      CalibratedMagneticField(
        MagneticField(0, 0, 0),
        MagneticFieldCalibrationAccuracy.uncalibrated,
      ),
      0,
    );
