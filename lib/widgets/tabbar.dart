import 'package:flutter/material.dart';

class ShopTabbar extends StatefulWidget {
  @override
  _ShopTabbarState createState() => _ShopTabbarState();
}

class _ShopTabbarState extends State<ShopTabbar> with TickerProviderStateMixin {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(254, 253, 242, 1),
      child: TabBar(
        controller: controller,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.favorite),
          ),
          Tab(
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
