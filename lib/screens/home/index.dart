import 'package:aesop_demo/screens/item_list/category_detail.dart';
import 'package:flutter/material.dart';

final List<int> categories = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];
final List<int> items = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];

class ShopTab extends StatefulWidget {
  @override
  _ShopTabState createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> with SingleTickerProviderStateMixin {
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

  @override
  void initState() {
    controller = TabController(vsync: this, length: 3);
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("menu clickeds");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print("shoping cart clicked");
            },
          )
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
                      "Aesop.",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Shop",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
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
