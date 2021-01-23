part of kgp_ui;

class BaseCard extends StatelessWidget {
  final double elevation;
  final Widget child;
  final Color shadowColor;
  final Color color;
  final Clip clipBehavior;

  const BaseCard({
    this.elevation,
    this.child,
    this.color,
    this.shadowColor,
    this.clipBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: color,
        elevation: elevation,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
