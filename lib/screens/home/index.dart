import 'dart:async';

import 'package:aesop_demo/screens/home/widgets/category.dart';
import 'package:aesop_demo/widgets/header.dart';
import 'package:aesop_demo/widgets/shop_appbar.dart';
import 'package:aesop_demo/widgets/tabbar.dart';
import 'package:flutter/material.dart';

final List<int> categories = <int>[];
final List<int> items = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];

class ShopTab extends StatefulWidget {
  @override
  _ShopTabState createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> with SingleTickerProviderStateMixin {
  ScrollController scrollController;


  bool scrolled = false;
  _scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent) {
      if (scrolled) {
        setState(() {
          scrolled = false;
        });
      }
    } else {
      if (!scrolled) {
        setState(() {
          scrolled = true;
        });
      }
    }
  }



  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
       Timer.periodic(Duration(milliseconds: 300), (Timer t) {
      if (categories.length > 14) {
        t.cancel();
      } else {
        if (this.mounted) {
          setState(() {
            categories.add(1);
          });
        }
      }
    });
    super.initState();

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("menu clickeds");
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print("shoping cart clicked");
              },
            )
          ]),
      bottomNavigationBar: ShopTabbar(),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Header(
              title: "Aēsop.",
              scrolled: scrolled,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Shop",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Category(
                    title: "Skin",
                    desc:
                        "Rule one in beauty is that you can own the best make up in the world, but it won't look good unless your skin is healthy.",
                    items: items,
                    color: index.isOdd
                        ? Color.fromRGBO(234, 234, 221, 1)
                        : Color.fromRGBO(245, 244, 231, 1),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class ShopHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context)
// }
