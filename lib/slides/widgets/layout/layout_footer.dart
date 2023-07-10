import 'package:flutter/widgets.dart';
import 'package:fluttercon_2023_presentation/slides/model/enum/layout_flex_units.dart';

class LayoutFooter extends StatelessWidget {
  LayoutFooter(this.widget, {int? flexUnits, super.key})
      : layoutFlexUnits = flexUnits ?? LayoutFlexUnits.footer.flexUnits;

  final Widget widget;
  final int layoutFlexUnits;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: layoutFlexUnits,
      child: widget,
    );
  }
}
