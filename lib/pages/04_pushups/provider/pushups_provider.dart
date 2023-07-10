import 'package:flutter_airpods/models/device_motion_data.dart';
import 'package:fluttercon_2023_presentation/helper/constants.dart';
import 'package:fluttercon_2023_presentation/pages/04_pushups/model/pushups.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PushupsProvider extends StateNotifier<Pushups> {
  PushupsProvider() : super(Pushups(0, inPushupMovement: false));

  Future<void> calculatePushups(DeviceMotionData? deviceMotionData) async {
    final userAccelerationY = deviceMotionData?.userAcceleration.y ?? 0;

    if (state.inPushupMovement) {
      if (_checkForUpwardsMovement(userAccelerationY)) {
        final newPushups = state.amount + 1;
        state = state.copyWith(amount: newPushups, inPushupMovement: false);
      }
    } else {
      if (_checkForDownwardsMovement(userAccelerationY)) {
        state = state.copyWith(inPushupMovement: true);
      }
    }
  }

  bool _checkForDownwardsMovement(num userAccelerationY) =>
      userAccelerationY < -AppConstants.pushupTransitionValue;

  bool _checkForUpwardsMovement(num userAccelerationY) =>
      userAccelerationY > AppConstants.pushupTransitionValue;
}

final pushupProvider = StateNotifierProvider<PushupsProvider, Pushups>((ref) {
  return PushupsProvider();
});
