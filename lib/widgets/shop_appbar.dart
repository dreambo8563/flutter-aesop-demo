import 'package:flutter/material.dart';

PreferredSizeWidget commonAppbar({Widget leading ,List<Widget> actions}) {
  return new AppBar(
    elevation: 0,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Color.fromRGBO(254, 253, 242, 1),
    leading: leading,
    actions: actions,
  );
}
