import 'package:flutter/material.dart';
import 'package:flutter_airpods/models/device_motion_data.dart';
import 'package:fluttercon_2023_presentation/generated/assets.gen.dart';
import 'package:fluttercon_2023_presentation/generated/l10n.dart';
import 'package:fluttercon_2023_presentation/pages/02_agenda/widgets/agenda_floating_head.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/airpods_data_provider.dart';
import 'package:fluttercon_2023_presentation/presentation/provider/presentation_controller_provider.dart';
import 'package:fluttercon_2023_presentation/presentation/widgets/fade_animation.dart';
import 'package:fluttercon_2023_presentation/slides/views/slide_title_and_photo_alt.dart';
import 'package:fluttercon_2023_presentation/styles/fc_gradients.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgendaSlide extends StatefulHookConsumerWidget {
  const AgendaSlide({super.key});

  @override
  AgendaSlideState createState() => AgendaSlideState();
}

class AgendaSlideState extends ConsumerState<AgendaSlide> {
  @override
  void dispose() {
    ref.watch(airpodsDataProvider.notifier).closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(presentationController).itemIndex;
    final motionStream = ref.watch(airpodsDataProvider).deviceMotionStream;

    return FadeAnimation(
      DecoratedBox(
        decoration: const BoxDecoration(
          gradient: FCGradients.backgroundPrimary,
        ),
        child: SlideTitleAndPhotoAlt(
          StreamBuilder<DeviceMotionData>(
            stream: motionStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Assets.images.titleAndPhotoSlideAlt.titleAndPhotoImageAlt
                        .image(
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    AgendaFloatingHead(snapshot.data),
                  ],
                );
              }

              return Assets.images.titleAndPhotoSlideAlt.titleAndPhotoImageAlt
                  .image(
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
                key: const Key('AgendaBackgroundNoModel'),
              );
            },
          ),
          S.of(context).agenda,
          [
            S.of(context).prologue,
            S.of(context).methodEventChannels,
            S.of(context).ffigenSetup,
            S.of(context).runFfigen,
            S.of(context).benefitsAndDownsides
          ],
          itemListdotted: true,
          itemListtextAlign: TextAlign.start,
          itemsPadding: const EdgeInsets.symmetric(vertical: 8),
          animateItems: true,
          currentIndex: index,
        ),
      ),
      100,
    );
  }
}
