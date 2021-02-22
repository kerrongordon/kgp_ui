import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'base_card.dart';

class BaseDropdownButton extends HookWidget {
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
  Widget build(BuildContext context) {
    final _dropList = useState<String>(initial);
    return BaseCard(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
            Expanded(
              child: DropdownButton<String>(
                isDense: true,
                dropdownColor: Colors.white,
                underline: Container(),
                isExpanded: true,
                items: items,
                value: _dropList.value,
                onChanged: (update) {
                  _dropList.value = update;
                  return onChanged(update);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
