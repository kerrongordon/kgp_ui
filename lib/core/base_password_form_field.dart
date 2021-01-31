import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'base_text_form_field.dart';
import '../validators/password-validator.dart';
import '../utils/field-focus-change.dart';

class BasePasswordFormField extends StatelessWidget {
  final String labelTextpassword;
  final MultiValidator passwordvalidatorFun;
  final void Function(String) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const BasePasswordFormField({
    this.labelTextpassword,
    this.passwordvalidatorFun,
    @required this.onSaved,
    this.focusNode,
    this.nextFocusNode,
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
      focusNode: focusNode,
      onFieldSubmitted: (val) => fieldFocusChange(
        context,
        focusNode,
        nextFocusNode,
      ),
    );
  }
}
