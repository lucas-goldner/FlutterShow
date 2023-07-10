import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercon_2023_presentation/styles/transitions/page_directional_animations.dart';

class DirectionalAnimation extends StatefulWidget {
  const DirectionalAnimation(
    this.child,
    this.delay,
    this.animation, {
    Curve? curve,
    super.key,
  }) : _curve = curve ?? Curves.bounceIn;
  final Widget child;
  final int delay;
  final Curve _curve;
  final PageDirectionalAnimations animation;

  @override
  DirectionalAnimState createState() => DirectionalAnimState();
}

class DirectionalAnimState extends State<DirectionalAnimation>
    with TickerProviderStateMixin {
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
    final curve = CurvedAnimation(
      curve: widget._curve,
      parent: animationController,
    );

    _animOffset =
        Tween<Offset>(begin: widget.animation.offset, end: Offset.zero)
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

    return SlideTransition(
      position: animOffset,
      child: widget.child,
    );
  }
}
