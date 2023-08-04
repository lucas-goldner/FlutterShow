import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MouseStyle {
  basic('Default Mouse', SystemMouseCursors.basic),
  hidden('No Mouse', SystemMouseCursors.none),
  custom('Custom Mouse', SystemMouseCursors.basic);

  const MouseStyle(this.styleName, this.cursor);

  final String styleName;
  final MouseCursor cursor;

  Future<MouseCursor> get customCursor async => CustomMouseCursor.icon(
        CupertinoIcons.circle,
        hotX: 8,
        hotY: 2,
        fill: 1,
        color: Colors.blueAccent,
      );
}
