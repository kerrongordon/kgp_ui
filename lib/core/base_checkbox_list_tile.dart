import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseCheckboxListTile extends HookWidget {
  final Widget title;
  final Widget subtitle;
  final bool initial;
  final void Function(bool) onChanged;

  const BaseCheckboxListTile({
    Key key,
    this.title,
    @required this.onChanged,
    this.initial,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _checkbox = useState<bool>(initial ?? false);
    return CheckboxListTile(
      title: title,
      subtitle: subtitle,
      onChanged: (value) {
        _checkbox.value = value;
        return onChanged(value);
      },
      value: _checkbox.value,
    );
  }
}
