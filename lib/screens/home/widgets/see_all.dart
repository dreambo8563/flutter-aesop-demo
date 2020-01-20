import 'package:aesop_demo/screens/item_list/index.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(new PageRouteBuilder(
                pageBuilder: (BuildContext context, _, __) {
              return CategoryDetail();
            }, transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
              return new FadeTransition(opacity: animation, child: child);
            }));
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  // height: 120,
                  child: Icon(Icons.arrow_forward),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "See all",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    "Eyes & Lisps (8)",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
