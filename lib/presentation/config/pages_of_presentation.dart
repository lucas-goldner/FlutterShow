import 'package:flutter/cupertino.dart';
import 'package:flutter_show/slides/01_title/view/title_slide.dart';
import 'package:flutter_show/slides/02_agenda/view/agenda_slide.dart';
import 'package:flutter_show/slides/03_motivation/view/motivation.dart';
import 'package:flutter_show/slides/04_downsides/view/downsides_slide.dart';
import 'package:flutter_show/slides/05_benefits/view/benefits_slide.dart';
import 'package:flutter_show/slides/06_outro/view/outo_slide.dart';

enum PagesOfPresentation {
  titleSlide(
    slide: TitleSlide(),
    items: 1,
    title: 'Title',
  ),
  agendaSlide(
    slide: AgendaSlide(),
    items: 1,
    title: 'Agenda',
  ),
  motivation(
    slide: MotivationSlide(),
    items: 4,
  ),
  downsides(
    slide: DownsidesSlide(),
    items: 6,
    title: 'Downsidessssss',
  ),
  benefits(
    slide: BenefitsSlide(),
    items: 6,
  ),
  outro(
    slide: OutroSlide(),
    items: 1,
    title: 'Fin',
  );

  const PagesOfPresentation({
    required this.slide,
    required this.items,
    this.title,
  });

  final Widget slide;
  final int items;
  final String? title;
}
