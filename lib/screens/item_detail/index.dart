import 'package:aesop_demo/screens/item_detail/widgets/animator.dart';
import 'package:aesop_demo/widgets/header.dart';
import 'package:aesop_demo/widgets/shop_appbar.dart';
import 'package:aesop_demo/widgets/tabbar.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  final int index;
  const ItemDetail({this.index});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> with TickerProviderStateMixin {
  int cartDurations = 1000;

  AnimationController cartController;
  Animation<double> _scale;
  

  int selectSize = 1;
  bool adding = false;

  @override
  void initState() {
    cartController = AnimationController(
        duration: Duration(milliseconds: cartDurations), vsync: this)
      ..addListener(() {
        setState(() {});
      });

    _scale = Tween(begin: 2.5, end: 0.0).animate(
        new CurvedAnimation(parent: cartController, curve: Curves.slowMiddle));

    super.initState();
  }

  @override
  void dispose() {
    cartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: commonAppbar(actions: [
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
                  title: "",
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Eyes & Lips ',
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
                            text: ' Hydrate',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Color.fromRGBO(254, 253, 242, 1),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 3,
                              child: Animator(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Wrap(
                                      children: <Widget>[
                                        Text(
                                          "Parsley Seed Eye Serum",
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child: Text(
                                        "Skin feel",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      children: <Widget>[
                                        Text(
                                          "Exceptionally soft with a greaseless finish",
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child: Text(
                                        "Aroma",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      children: <Widget>[
                                        Text(
                                          "Woody, earthy, smoky",
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 24.0),
                                      child: Text(
                                        "Key Ingredients",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      children: <Widget>[
                                        Text(
                                          "Bergamot Rind. Vetiver Root. Petitgrain",
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        )
                                      ],
                                    ),
                                    ListTileTheme(
                                      contentPadding: EdgeInsets.only(left: 0),
                                      dense: true,
                                      textColor: Colors.black38,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: <Widget>[
                                            RadioListTile(
                                              title: Text('Lafayette'),
                                              activeColor: Colors.black38,
                                              value: 1,
                                              groupValue: selectSize,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectSize = value;
                                                });
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: .0),
                                              child: RadioListTile(
                                                title: Text('Lafayette'),
                                                value: 2,
                                                activeColor: Colors.black38,
                                                groupValue: selectSize,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectSize = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        cartController.forward();
                                        setState(() {
                                          adding = true;
                                        });
                                      },
                                      color: Colors.black87,
                                      child: Text(
                                        "Add to cart - \$585.00",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Flexible(
                            flex: 2,
                            child: Container(),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          onEnd: (){
            Navigator.pop(context);
          },
            duration: Duration(milliseconds: cartDurations),
            top: adding ? -MediaQuery.of(context).size.height / 2 + 60 : 0,
            right: adding
                ? -MediaQuery.of(context).size.width / 5 * 3 / 2 + 20
                : -MediaQuery.of(context).size.width / 5 * 3 / 3,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 5 * 3,
            child: Hero(
              tag: 'shop${widget.index}',
              child: Center(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: cartDurations),
                  opacity: adding ? 0 : 1,
                  child: Transform.scale(
                    scale: _scale == null ? 2.5 : _scale.value,
                    child: Image.asset(
                      'assets/images/a.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
