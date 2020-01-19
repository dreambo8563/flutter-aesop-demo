import 'package:flutter/material.dart';
import 'package:aesop_demo/screens/home/index.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(73, 202, 206, 1),
            ),
            // Start the app with the "/" named route. In this case, the app starts
            // on the FirstScreen widget.
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => ShopTab(),
              // When navigating to the "/second" route, build the SecondScreen widget.
            });
  }
}
