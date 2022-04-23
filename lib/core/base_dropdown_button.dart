import 'package:flutter/material.dart';

import 'base_card.dart';

class BaseDropdownButton extends StatefulWidget {
  final String initial;
  final Widget icon;
  final void Function(String) onChanged;
  final List<DropdownMenuItem<String>> items;

  const BaseDropdownButton({
    Key key,
    this.items,
    this.icon,
    @required this.initial,
    this.onChanged,
  }) : super(key: key);

  @override
  State<BaseDropdownButton> createState() => _BaseDropdownButtonState();
}

class _BaseDropdownButtonState extends State<BaseDropdownButton> {
  String _dropList;

  @override
  void initState() {
    super.initState();
    _dropList = widget.initial;
  }

  @override
  void dispose() {
    super.dispose();
    _dropList = null;
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: widget.icon,
            ),
            Expanded(
              child: DropdownButton<String>(
                isDense: true,
                dropdownColor: Colors.white,
                underline: Container(),
                isExpanded: true,
                items: widget.items,
                value: _dropList,
                onChanged: (update) {
                  _dropList = update;
                  return widget.onChanged(update);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
