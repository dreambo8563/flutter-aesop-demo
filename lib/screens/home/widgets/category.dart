import 'package:aesop_demo/screens/home/widgets/item.dart';
import 'package:aesop_demo/screens/home/widgets/see_all.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final String desc;
  final List<int> items;

  final Color color;

  const Category({Key key, this.title, this.desc, this.color, this.items=const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    desc,
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
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final bool lastNode = index == items.length - 1;
                if (lastNode) {
                  return SeeAllButton();
                }
                return ShopItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
