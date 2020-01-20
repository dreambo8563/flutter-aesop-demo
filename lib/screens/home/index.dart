import 'package:aesop_demo/screens/item_list/index.dart';
import 'package:aesop_demo/widgets/header.dart';
import 'package:aesop_demo/widgets/shop_appbar.dart';
import 'package:aesop_demo/widgets/tabbar.dart';
import 'package:flutter/material.dart';

final List<int> categories = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];
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
      setState(() {
        scrolled = false;
      });
    } else {
      setState(() {
        scrolled = true;
      });
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
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
              title: "Aesop.",
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
                  return Container(
                    height: 280,
                    color: index.isOdd
                        ? Color.fromRGBO(234, 234, 221, 1)
                        : Color.fromRGBO(245, 244, 231, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Skin",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "Rule one in beauty is that you can own the best make up in the world, but it won't look good unless your skin is healthy.",
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
                                  return Container(
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              new PageRouteBuilder(pageBuilder:
                                                  (BuildContext context, _,
                                                      __) {
                                            return CategoryDetail();
                                          }, transitionsBuilder: (_,
                                                  Animation<double> animation,
                                                  __,
                                                  Widget child) {
                                            return new FadeTransition(
                                                opacity: animation,
                                                child: child);
                                          }));
                                        },
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                // height: 120,
                                                child:
                                                    Icon(Icons.arrow_forward),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 16),
                                                child: Text(
                                                  "See all",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "Eyes & Lisps (8)",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500),
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

                                return Container(
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 120,
                                          child: Image.asset(
                                              'assets/images/a.png',
                                              fit: BoxFit.contain),
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
                              }),
                        )
                      ],
                    ),
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
