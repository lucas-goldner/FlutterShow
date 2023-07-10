import 'package:flutter/cupertino.dart';
import 'package:flutter_show/slides/01_title/view/title_slide.dart';
import 'package:flutter_show/slides/02_agenda/view/agenda_slide.dart';
import 'package:flutter_show/slides/03_motivation/view/motivation.dart';
import 'package:flutter_show/slides/04_downsides/view/downsides_slide.dart';
import 'package:flutter_show/slides/05_benefits/view/benefits_slide.dart';
import 'package:flutter_show/slides/06_outro/view/outo_slide.dart';

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
