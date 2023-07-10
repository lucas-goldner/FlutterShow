import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_airpods/models/device_motion_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttercon_2023_presentation/pages/04_pushups/provider/pushups_provider.dart';
import 'package:fluttercon_2023_presentation/pages/04_pushups/widgets/pushup_counter.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/airpods_data_provider.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PushupSlide extends HookConsumerWidget {
  const PushupSlide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confettiControler =
        useState(ConfettiController(duration: const Duration(seconds: 10)));
    final motionStream = ref.watch(airpodsDataProvider).deviceMotionStream;
    final pushupsCalculator =
        ref.read<PushupsProvider>(pushupProvider.notifier);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: FCGradients.backgroundPrimary,
      ),
      child: Stack(
        children: [
          StreamBuilder<DeviceMotionData>(
            stream: motionStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                pushupsCalculator.calculatePushups(snapshot.data);
                if (pushupsCalculator.state.amount == 5) {
                  confettiControler.value.play();
                }

                return PushupCounter(pushupsCalculator.state.amount);
              }

              return const PushupCounter(0);
            },
          ),
          Center(
            child: ConfettiWidget(
              emissionFrequency: 1,
              confettiController: confettiControler.value,
              shouldLoop: true,
              blastDirectionality: BlastDirectionality.explosive,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], //
            ),
          ),
        ],
      ),
    );
  }
}
