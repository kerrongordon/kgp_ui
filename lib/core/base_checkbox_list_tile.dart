import 'package:flutter/material.dart';

class BaseCheckboxListTile extends StatefulWidget {
  final Widget title;
  final Widget subtitle;
  final bool initial;
  final void Function(bool) onChanged;

  const BaseCheckboxListTile({
    Key? key,
    required this.title,
    required this.onChanged,
    this.initial = false,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<BaseCheckboxListTile> createState() => _BaseCheckboxListTileState();
}

class _BaseCheckboxListTileState extends State<BaseCheckboxListTile> {
  late bool _checkbox;

  @override
  void initState() {
    super.initState();
    _checkbox = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: widget.title,
      subtitle: widget.subtitle,
      onChanged: (value) {
        _checkbox = value!;
        return widget.onChanged(value);
      },
      value: _checkbox,
    );
  }
}
