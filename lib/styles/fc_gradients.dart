import 'package:flutter/cupertino.dart';

class FCGradients {
  static const LinearGradient animatedTitlePrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      CupertinoColors.systemIndigo,
      CupertinoColors.systemPurple,
      CupertinoColors.systemPink,
    ],
  );

  static const LinearGradient titlePrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      CupertinoColors.systemTeal,
      CupertinoColors.systemIndigo,
      CupertinoColors.systemPurple,
      CupertinoColors.systemPink,
    ],
  );

  static const LinearGradient backgroundPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      CupertinoColors.systemBackground,
      Color.fromARGB(255, 205, 220, 246),
    ],
    stops: [0.5, 1.0],
  );

  static const LinearGradient downsidesGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 75, 41, 41),
      Color.fromARGB(255, 180, 37, 37),
    ],
    stops: [0.05, 0.3],
  );

  static const LinearGradient benefitsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 6, 100, 40),
      Color.fromARGB(255, 18, 196, 83),
    ],
    stops: [0.05, 0.3],
  );
}
