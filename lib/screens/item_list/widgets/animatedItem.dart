import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final int index;
  const AnimatedItem({this.index});

  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with TickerProviderStateMixin {
  Animation<double> _textOpacity;
  Animation<double> _priceOpacity;
  Animation<double> _picOpacity;
  double _itemOpacity = 1;

  AnimationController tranformController;
  AnimationController priceController;
  AnimationController picController;

  AnimationController _controller;

  Animation<double> transformVal;
  Animation<double> priceVal;
  Animation<double> picVal;

  int transitionDuration = 1000;
  double transitionDistance = 10.0;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this);

    picVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeInOut)));

    _picOpacity = Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.2, curve: Curves.easeInOut)));

    transformVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(
            parent: _controller,
            curve: Interval(0.2, 0.66, curve: Curves.easeInOut)));
    _textOpacity = Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.4, curve: Curves.easeInOut)));

    priceVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));

    _priceOpacity = Tween(begin: 0.0, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 0.6, curve: Curves.easeInOut)));

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _itemOpacity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform.translate(
            offset:
                Offset(0, picVal != null ? picVal.value : transitionDistance),
            child: Hero(
              tag: 'shop${widget.index}',
              child: AnimatedOpacity(
                duration: Duration(milliseconds: transitionDuration),
                opacity: _picOpacity.value,
                child: Image.asset('assets/images/a.png', fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Transform.translate(
              offset: Offset(
                  0,
                  transformVal != null
                      ? transformVal.value
                      : transitionDistance),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: transitionDuration),
                opacity: _textOpacity.value,
                child: Text(
                  "Parsley Seed",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0,
                transformVal != null ? transformVal.value : transitionDistance),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: transitionDuration),
              opacity: _textOpacity.value,
              child: Text(
                "Eye Cream",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(
                0, priceVal != null ? priceVal.value : transitionDistance),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: transitionDuration),
              opacity: _priceOpacity.value,
              child: Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  '10ml / \$62.5',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
