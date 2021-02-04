import 'package:flutter/material.dart';

import 'base_text_form_field.dart';
import '../validators/password-validator.dart';
import '../utils/field-focus-change.dart';

class BasePasswordFormField extends StatelessWidget {
  final String labelTextpassword;
  final String Function(String) passwordvalidatorFun;
  final void Function(String) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String) onChanged;

  const BasePasswordFormField({
    @required this.labelTextpassword,
    @required this.passwordvalidatorFun,
    @required this.onSaved,
    @required this.focusNode,
    @required this.nextFocusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: Icon(Icons.fingerprint),
      keyboardType: TextInputType.text,
      labelText: labelTextpassword ?? 'Password',
      obscureText: true,
      validator: passwordvalidatorFun ?? passwordValidator,
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
