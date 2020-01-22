import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  final Widget child;

  final bool reverse;

  const Animator({Key key, @required this.child, this.reverse})
      : super(key: key);

  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator> with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _opacity;
  Animation<double> _transform;

  final double distantce = 10.0;
  final int duration = 1000;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: duration), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    final Animation curve = CurvedAnimation(
        parent: _controller, curve: Interval(0.4, 1, curve: Curves.easeInOut));

    _transform = Tween(begin: distantce, end: 0.0).animate(curve);
    _opacity = Tween(begin: 0.0, end: 1.0).animate(curve);

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Animator oldWidget) {
    if (!oldWidget.reverse && widget.reverse) {
      _controller.reverse().whenComplete(() {
        Navigator.pop(context);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _transform != null ? _transform.value : distantce),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          opacity: _opacity != null ? _opacity.value : 0.0,
          child: widget.child,
        ),
      ),
    );
  }
}
