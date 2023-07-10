import 'package:flutter/animation.dart';

enum PageDirectionalAnimations {
  top(Offset(0, 1)),
  bottom(Offset(0, -1)),
  left(Offset(-1, 0)),
  right(Offset(1, 0));

  const PageDirectionalAnimations(this.offset);

  final Offset offset;
}
