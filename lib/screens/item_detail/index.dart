import 'package:aesop_demo/widgets/tabbar.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  final int index;
  const ItemDetail({this.index});

  @override
  _ItemDetailState createState() => _ItemDetailState(index: index);
}

class _ItemDetailState extends State<ItemDetail> with TickerProviderStateMixin {
  final int index;
  double _contentOpacity = 0;
  int transitionDuration = 1500;
  double transitionDistance = 10;

  AnimationController contentController;
  Animation<double> transformVal;

  _ItemDetailState({this.index});

  int selectSize = 1;

  @override
  void initState() {
  
    contentController = AnimationController(
        duration: Duration(milliseconds: transitionDuration), vsync: this)
      ..addListener(() => setState(() {}));

    transformVal = Tween(begin: transitionDistance, end: 0.0).animate(
        new CurvedAnimation(
            parent: contentController, curve: Curves.easeInOut));

   Future.delayed(Duration(milliseconds: 600),(){
      if (this.mounted) {
      contentController.forward();
      setState(() {
        _contentOpacity = 1;
      });
    }
   });
    super.initState();
  }

  @override
  void dispose() {
   
    contentController.dispose();
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
      bottomNavigationBar:ShopTabbar(),
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.black12.withOpacity(0),
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
                      "",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
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
                  ],
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
                        child: Transform.translate(
                          offset: Offset(
                              0,
                              transformVal != null
                                  ? transformVal.value
                                  : transitionDistance),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: _contentOpacity,
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
                                          padding:
                                              const EdgeInsets.only(top: .0),
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              // overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  child: Transform.translate(
                                    offset: Offset(60, 0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: Hero(
                                        tag: 'shop$index',
                                        child: Center(
                                          child: Transform.scale(
                                            scale: 4,
                                            child: Image.asset(
                                              'assets/images/a.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
