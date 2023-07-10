import 'package:flutter/cupertino.dart';
import 'package:fluttercon_2023_presentation/pages/01_title/view/title_slide.dart';
import 'package:fluttercon_2023_presentation/pages/02_agenda/view/agenda_slide.dart';
import 'package:fluttercon_2023_presentation/pages/03_motivation/view/motivation.dart';
import 'package:fluttercon_2023_presentation/pages/04_downsides/view/downsides_slide.dart';
import 'package:fluttercon_2023_presentation/pages/05_benefits/view/benefits_slide.dart';
import 'package:fluttercon_2023_presentation/pages/06_outro/view/outo_slide.dart';

enum PagesOfPresentation {
  titleSlide(TitleSlide(), 1),
  agendaSlide(
    AgendaSlide(),
    5,
  ),
  motivation(MotivationSlide(), 4),
  downsides(DownsidesSlide(), 4),
  benefits(BenefitsSlide(), 5),
  outro(OutroSlide(), 1);

  const PagesOfPresentation(this.slide, this.items);

  final Widget slide;
  final int items;
}
