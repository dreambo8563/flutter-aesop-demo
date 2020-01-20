import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget child;
  final bool scrolled;
  final String title;

  Header(
      {Key key, this.title = "", this.scrolled = false, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("header build");
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black12.withOpacity(scrolled ? 0.2 : 0),
          width: 0.5,
        )),
      ),
      child: Container(
        color: Color.fromRGBO(254, 253, 242, 1),
        height: 90,
        width: double.infinity,
        padding: EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
