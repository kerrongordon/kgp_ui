import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kgp_ui/components/base_screen_title.dart';

class BaseScreen extends StatelessWidget {
  final bool? disableScroll;
  final String title;
  final double? expandedHeight;
  final Widget? flexibleBackground;
  final Widget? child;
  final double? elevation;
  final Color? titleColor;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final IconThemeData? actionsIconTheme;
  final IconThemeData? iconTheme;
  final ShapeBorder? shape;
  final List<Widget>? actions;

  const BaseScreen({
    Key? key,
    this.disableScroll,
    required this.title,
    this.expandedHeight,
    this.flexibleBackground,
    this.elevation,
    this.child,
    this.actions,
    this.titleColor,
    this.systemOverlayStyle,
    this.backgroundColor,
    this.actionsIconTheme,
    this.iconTheme,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return CustomScrollView(
      physics: _physicsScroll(),
      slivers: [
        SliverAppBar(
          expandedHeight: expandedHeight ?? media.size.height / 2.5,
          pinned: true,
          elevation: elevation,
          actions: actions,
          systemOverlayStyle: systemOverlayStyle,
          backgroundColor: backgroundColor,
          actionsIconTheme: actionsIconTheme,
          iconTheme: iconTheme,
          shape: shape,
          flexibleSpace: FlexibleSpaceBar(
            title: BaseTitle(
              title: title,
              color: titleColor!,
            ),
            centerTitle: true,
            background: flexibleBackground,
          ),
        ),
        SliverToBoxAdapter(child: child)
      ],
    );
  }

  ScrollPhysics _physicsScroll() {
    return disableScroll == true
        ? const NeverScrollableScrollPhysics()
        : const AlwaysScrollableScrollPhysics();
  }
}
