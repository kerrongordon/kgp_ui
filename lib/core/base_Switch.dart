import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseSwitch extends HookWidget {
  final String title;
  final bool init;
  final void Function(bool) onChanged;

  const BaseSwitch({
    Key key,
    @required this.title,
    @required this.init,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _toggle = useState<bool>(init);
    return Row(
      children: [
        Switch(
          onChanged: (val) {
            _toggle.value = val;
            onChanged(val);
          },
          value: _toggle.value,
        ),
        TextButton(
          onPressed: () {
            _toggle.value = !_toggle.value;
            onChanged(_toggle.value);
          },
          child: Text(title),
        ),
      ],
    );
  }
}
