import 'package:flutter_show/presentation/provider/presentation_controller_provider.dart';
import 'package:flutter_show/slides/01_title/view/title_slide.dart';
import 'package:flutter_show/slides/02_agenda/view/agenda_slide.dart';
import 'package:flutter_show/slides/03_motivation/view/motivation.dart';
import 'package:flutter_show/slides/04_downsides/view/downsides_slide.dart';
import 'package:flutter_show/slides/05_benefits/view/benefits_slide.dart';
import 'package:flutter_show/slides/06_outro/view/outo_slide.dart';
import 'package:fluttershow_base/components/model/presentation_page.dart';

enum PagesOfPresentation {
  titleSlide(
    PresentationSlide(
      slideWidget: TitleSlide(),
      title: 'Title',
    ),
  ),
  agendaSlide(
    PresentationSlide(
      slideWidget: AgendaSlide(),
      title: 'Agenda',
    ),
  ),
  motivation(
    PresentationSlide(
      slideWidget: MotivationSlide(),
      animationSteps: 4,
    ),
  ),
  downsides(
    PresentationSlide(
      slideWidget: DownsidesSlide(),
      animationSteps: 6,
      title: 'Downsidessssss',
    ),
  ),
  benefits(
    PresentationSlide(
      slideWidget: BenefitsSlide(),
      animationSteps: 6,
    ),
  ),
  outro(
    PresentationSlide(
      slideWidget: OutroSlide(),
      title: 'Fin',
    ),
  );

  /// [PagesOfPresentation] is an enum, where each slides are stored
  /// in its appearance order.
  /// It contains multiple [PresentationSlide]
  const PagesOfPresentation(this.slide);

  /// A [PresentationSlide] consists of:
  /// - `slideWidget` is the widget that will be used as slide
  ///
  /// - The `animationIndex` property, in combination with the `animationSteps`
  /// property of [presentationController], indicates which item will be
  /// animated/shown next during the presentation.
  ///
  /// It represents the current step of the animation in the presentation.
  /// It determines the number of times a slide can be clicked before
  /// switching to the next slide in the enum. By default, one click
  /// on a slide will directly switch to the next slide, since `animationSteps`
  /// is set to 1.
  ///
  /// It keeps track of the progress of the animation, indicating the current
  /// step in the sequence.
  ///
  /// An example usage can be seen in the [DownsidesSlide] slide.
  /// The enum member [PagesOfPresentation.downsides] has 6 `animationSteps`.
  /// Clicking on the slide increments the `animationIndex` by one.
  ///
  /// Example:
  /// - Downsides title appears: `animationIndex` is 0.
  /// - Really bad subtitle appears: `animationIndex` is 1.
  /// - Annoying bullet point appears: `animationIndex` is 2.
  /// - Boring bullet point appears: `animationIndex` is 3.
  /// - Lazy bullet point appears: `animationIndex` is 4.
  /// - It's not Flutter bullet point appears: `animationIndex` is 5.
  /// - When `animationIndex` reaches 6, it switches to the next slide.
  ///
  /// - `title` is optional, since it will only be seen on the Menu
  /// (which can be opened using the `M` key btw).
  /// If no title is set it will default to `Slide-{index}` as its title.
  final PresentationSlide slide;
}

extension PagesOfPresentationListExtension on List<PagesOfPresentation> {
  List<PresentationSlide> get slides =>
      map((presentationPage) => presentationPage.slide).toList();
}
