import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_show/generated/l10n.dart';

enum CursorStyle {
  basic('Default Cursor', SystemMouseCursors.basic),
  hidden('No Cursor', SystemMouseCursors.none),
  custom('Custom Cursor', SystemMouseCursors.basic);

  const CursorStyle(this.styleName, this._cursor);

  final String styleName;
  final MouseCursor _cursor;

  String getLocalizedName(BuildContext context) => switch (this) {
        CursorStyle.basic => S.of(context).basic,
        CursorStyle.hidden => S.of(context).hidden,
        CursorStyle.custom => S.of(context).custom,
      };

  Future<MouseCursor> get cursor => switch (this) {
        CursorStyle.basic => Future.value(_cursor),
        CursorStyle.hidden => Future.value(_cursor),
        CursorStyle.custom => customCursor,
      };

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
