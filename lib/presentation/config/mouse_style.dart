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

  /// Edit the custom cursor however you like:
  ///
  /// - Either set a custom image
  /// CustomMouseCursor.asset('myCursorImage.png',  hotX:2, hotY:2 );
  ///
  /// - Or use an icon
  /// CustomMouseCursor.icon( Icons.redo, size: 24, hotX: 22, hotY: 17 );
  ///
  /// More information at: [https://pub.dev/packages/custom_mouse_cursor]
  Future<MouseCursor> get customCursor async => CustomMouseCursor.icon(
        CupertinoIcons.circle,
        hotX: 8,
        hotY: 2,
        fill: 1,
        color: Colors.blueAccent,
      );
}
