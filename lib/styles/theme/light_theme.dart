import 'package:flutter/cupertino.dart';
import 'package:flutter_show/styles/fs_colors.dart';

CupertinoThemeData get lightTheme => const CupertinoThemeData(
      brightness: Brightness.light,
      textTheme:
          CupertinoTextThemeData(primaryColor: FSColors.regularTextColor),
    );
