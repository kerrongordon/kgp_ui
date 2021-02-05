import 'package:flutter/material.dart';

class BaseTitle extends StatelessWidget {
  final String title;
  final Color color;

  const BaseTitle({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(flex: 4, child: Container()),
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color),
            ),
          ),
        ),
        // Flexible(flex: 1, child: Container()),
      ],
    );
  }
}
