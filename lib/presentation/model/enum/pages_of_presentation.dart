import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/pages/01_title/view/title_slide.dart';
import 'package:fluttercon_2023_presentation/pages/02_agenda/view/agenda_slide.dart';
import 'package:fluttercon_2023_presentation/pages/03_motivation/view/motivation.dart';
import 'package:fluttercon_2023_presentation/pages/04_pushups/view/pushup_slide.dart';
import 'package:fluttercon_2023_presentation/pages/05_solution/view/solution_slide.dart';
import 'package:fluttercon_2023_presentation/pages/06_method_channels/view/method_channels_slide.dart';
import 'package:fluttercon_2023_presentation/pages/07_event_channel_flutter_setup/view/event_channel_flutter_setup_slide.dart';
import 'package:fluttercon_2023_presentation/pages/08_event_channel_ios_setup/view/event_channel_ios_slide.dart';
import 'package:fluttercon_2023_presentation/pages/09_ffigen_explanation/view/ffigen_explanation_slide.dart';
import 'package:fluttercon_2023_presentation/pages/10_config_file/view/config_file_slide.dart';
import 'package:fluttercon_2023_presentation/pages/11_xcode_linking/view/xcode_linking_slide.dart';
import 'package:fluttercon_2023_presentation/pages/12_cmheadphone_provider/view/cmheadphone_provider_slide.dart';
import 'package:fluttercon_2023_presentation/pages/13_downsides/view/downsides_slide.dart';
import 'package:fluttercon_2023_presentation/pages/14_benefits/view/benefits_slide.dart';
import 'package:fluttercon_2023_presentation/pages/15_outro/view/outo_slide.dart';

enum PagesOfPresentation {
  titleSlide(TitleSlide(), 1),
  agendaSlide(
    AgendaSlide(),
    5,
  ),
  motivation(MotivationSlide(), 4),
  pushups(PushupSlide(), 1),
  solution(SolutionSlide(), 3),
  methodChannels(MethodChannelsSlide(), 2),
  eventChannelFlutterSetup(EventChannelFlutterSetupSlide(), 1),
  eventChanneliOSSetup(
    EventChanneliOSSlide(),
    1,
  ),
  ffigenExplanation(
    FFIGenExplanationSlide(),
    5,
  ),
  configFile(
    ConfigFileSlide(),
    2,
  ),
  xcodeLinking(XcodeLinkingSlide(), 3),
  cmheadphoneProvider(CMHeadphoneProviderSlide(), 2),
  downsides(DownsidesSlide(), 4),
  benefits(BenefitsSlide(), 5),
  outro(OutroSlide(), 1);

  const PagesOfPresentation(this.slide, this.items);

  final Widget slide;
  final int items;
}
