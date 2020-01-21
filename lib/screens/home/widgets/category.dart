import 'package:aesop_demo/screens/home/widgets/item.dart';
import 'package:aesop_demo/screens/home/widgets/see_all.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String title;
  final String desc;
  final List<int> items;

  final Color color;

  Category({Key key, this.title, this.desc, this.color, this.items = const []})
      : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  final int duration = 700;
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    ));
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
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        height: 280,
        color: widget.color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.desc,
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final bool lastNode = index == widget.items.length - 1;
                  if (lastNode) {
                    return SeeAllButton();
                  }
                  return AnimatedOpacity(
                      opacity: _opacityAnimation.value,
                      duration: Duration(milliseconds: duration),
                      child: ShopItem());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
