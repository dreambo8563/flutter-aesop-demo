import 'dart:async';

import 'package:flutter/material.dart';
import 'package:aesop_demo/screens/item_detail.dart';
import './animatedItem.dart';

class CategoryDetail extends StatefulWidget {
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail>
    with TickerProviderStateMixin {
  TabController controller;
  ScrollController scrollController;
  double shadowWidth = 0;
  _scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent) {
      setState(() {
        shadowWidth = 0;
      });
    } else {
      setState(() {
        shadowWidth = 0.2;
      });
    }
  }

  List<int> list = [];

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    Timer.periodic(Duration(milliseconds: 300), (Timer t) {
      if (list.length > 14) {
        t.cancel();
      } else {
        if (this.mounted) {
          setState(() {
            list.add(1);
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color.fromRGBO(254, 253, 242, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print("shoping cart clicked");
            },
          ),
        ],
      ),
      bottomNavigationBar: Material(
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
      ),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12.withOpacity(shadowWidth),
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
                      "Eyes & Lips",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'All Products ',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.black38),
                          children: <TextSpan>[
                            TextSpan(
                              text: '·',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: ' Eyes Lisp',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Color.fromRGBO(254, 253, 242, 1),
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        (150 / 200), // used to change height of gridItem
                  ),
                  itemBuilder: (_, index) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          child: Column(
                            children: <Widget>[
                              Flexible(flex: 1, child: Container()),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                      color: Color.fromRGBO(244, 244, 231, 1)))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(new PageRouteBuilder(
                                pageBuilder: (BuildContext context, _, __) {
                              return ItemDetail(index: index);
                            }, transitionsBuilder: (_,
                                    Animation<double> animation,
                                    __,
                                    Widget child) {
                              return new FadeTransition(
                                  opacity: animation, child: child);
                            }));
                          },
                          child: Center(
                            child: FractionallySizedBox(
                              widthFactor: 0.8,
                              heightFactor: 0.8,
                              child: AnimatedItem(index: index),
                            ),
                            // color: Colors.red[100],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: list.length,
                  // shrinkWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
