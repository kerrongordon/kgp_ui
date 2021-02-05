import 'package:flutter/material.dart';

class FooterAuth extends StatelessWidget {
  final void Function() onTap;
  final String action;
  final String detail;

  const FooterAuth({
    Key key,
    this.onTap,
    this.action,
    this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$detail  '),
            Text(
              action,
              style: TextStyle(
                color: theme.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
