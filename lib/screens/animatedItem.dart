import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final int index;
  const AnimatedItem({this.index});

  @override
  _AnimatedItemState createState() => _AnimatedItemState(index: index);
}

class _AnimatedItemState extends State<AnimatedItem>
    with TickerProviderStateMixin {
  final int index;
  _AnimatedItemState({this.index});
  double _textOpacity = 0;
  double _priceOpacity = 0;
  double _picOpacity = 0;
  double _itemOpacity = 0;

  AnimationController itemShowController;
  AnimationController tranformController;
  AnimationController priceController;
  AnimationController picController;

  Animation<double> transformVal;
  Animation<double> priceVal;
  Animation<double> picVal;

  int transitionDuration = 200;
  double transitionDistance = 10;

  @override
  void initState() {
    itemShowController = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this)
      ..addListener(() => setState(() {}));
    tranformController = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this)
      ..addListener(() => setState(() {}));

    priceController = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this)
      ..addListener(() => setState(() {}));
    picController = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this)
      ..addListener(() => setState(() {}));

    transformVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(
            parent: tranformController, curve: Curves.easeInOut));

    priceVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(parent: priceController, curve: Curves.easeInOut));
    picVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(parent: picController, curve: Curves.easeInOut));

    if (this.mounted) {
      itemShowController.forward();
      setState(() {
        _itemOpacity = 1;
      });
    }
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (this.mounted) {
        picController.forward();

        setState(() {
          _picOpacity = 1;
        });
      }
      Future.delayed(const Duration(milliseconds: 400), () {
        if (this.mounted) {
          tranformController.forward();
          setState(() {
            _textOpacity = 1;
          });
        }
        Future.delayed(const Duration(milliseconds: 400), () {
          if (this.mounted) {
            priceController.forward();
            setState(() {
              _priceOpacity = 1;
            });
          }
        });
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // itemShowController.stop();
    itemShowController.dispose();

    // tranformController.stop();
    tranformController.dispose();

    // picController.stop();
    picController.dispose();

    // priceController.stop();
    priceController.dispose();
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
              tag: 'shop$index',
              child: AnimatedOpacity(
                duration: Duration(milliseconds: transitionDuration),
                opacity: _picOpacity,
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
                opacity: _textOpacity,
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
              opacity: _textOpacity,
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
              opacity: _priceOpacity,
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
