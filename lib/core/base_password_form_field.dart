import 'package:flutter/material.dart';

import '../utils/field-focus-change.dart';
import '../validators/password-validator.dart';
import 'base_text_form_field.dart';

class BasePasswordFormField extends StatelessWidget {
  final String labelTextpassword;
  final String Function(String) passwordvalidatorFun;
  final void Function(String) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String) onChanged;

  const BasePasswordFormField({
    Key key,
    @required this.labelTextpassword,
    @required this.passwordvalidatorFun,
    @required this.onSaved,
    @required this.focusNode,
    @required this.nextFocusNode,
    this.onChanged,
  }) : super(key: key);

  String Function(String) validator() {
    if (passwordvalidatorFun == null) {
      return passwordValidator;
    }
    return passwordvalidatorFun;
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: const Icon(Icons.fingerprint),
      keyboardType: TextInputType.text,
      labelText: labelTextpassword ?? 'Password',
      obscureText: true,
      validator: validator(),
      onSaved: onSaved,
      onChanged: onChanged,
      focusNode: focusNode,
      onFieldSubmitted: (val) => fieldFocusChange(
        context,
        focusNode,
        nextFocusNode,
      ),
    );
  }
}
