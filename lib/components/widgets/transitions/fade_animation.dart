import 'dart:async';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation(
    this.child,
    this.delay, {
    Curve? curve,
    super.key,
  }) : _curve = curve ?? Curves.bounceIn;
  final Widget child;
  final int delay;
  final Curve _curve;

  @override
  FadeAnimState createState() => FadeAnimState();
}

class FadeAnimState extends State<FadeAnimation> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animController = animationController;
    final curve =
        CurvedAnimation(curve: widget._curve, parent: animationController);
    _animOffset = Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
        .animate(curve);

    _timer = Timer(Duration(milliseconds: widget.delay), _animate);
  }

  void _animate() {
    _animController?.forward();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animationController = _animController;
    final animOffset = _animOffset;
    if (animationController == null || animOffset == null) {
      return widget.child;
    }

    return FadeTransition(
      opacity: animationController,
      child: widget.child,
    );
  }
}
