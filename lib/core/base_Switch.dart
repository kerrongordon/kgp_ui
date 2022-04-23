import 'package:flutter/material.dart';

class BaseSwitch extends StatefulWidget {
  final String title;
  final bool init;
  final void Function(bool) onChanged;

  const BaseSwitch({
    Key? key,
    required this.title,
    required this.init,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<BaseSwitch> createState() => _BaseSwitchState();
}

class _BaseSwitchState extends State<BaseSwitch> {
  late bool _toggle;

  @override
  void initState() {
    super.initState();
    _toggle = widget.init;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          onChanged: (val) {
            _toggle = val;
            widget.onChanged(val);
          },
          value: _toggle,
        ),
        TextButton(
          onPressed: () {
            _toggle = !_toggle;
            widget.onChanged(_toggle);
          },
          child: Text(widget.title),
        ),
      ],
    );
  }
}
