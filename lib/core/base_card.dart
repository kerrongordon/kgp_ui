import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final double elevation;
  final Widget child;
  final Color shadowColor;
  final Color color;
  final Clip clipBehavior;

  const BaseCard({
    Key key,
    this.elevation,
    this.child,
    this.color,
    this.shadowColor,
    this.clipBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: color,
        elevation: elevation,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: child,
      ),
    );
  }
}
