import 'package:flutter/material.dart';

class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              child: Image.asset('assets/images/a.png', fit: BoxFit.contain),
            ),
            Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Watermelon Glow Sleeping Mask",
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
