import 'package:flutter/widgets.dart';

void fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  return FocusScope.of(context).requestFocus(nextFocus);
}
