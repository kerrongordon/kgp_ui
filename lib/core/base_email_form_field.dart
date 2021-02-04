import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'base_text_form_field.dart';
import '../validators/email-validator.dart';
import '../utils/field-focus-change.dart';

class BaseEmailFormField extends StatelessWidget {
  final String labelTextemail;
  final MultiValidator emailvalidatorFun;
  final void Function(String) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const BaseEmailFormField({
    @required this.labelTextemail,
    @required this.emailvalidatorFun,
    @required this.onSaved,
    @required this.focusNode,
    @required this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: Icon(Icons.alternate_email),
      keyboardType: TextInputType.emailAddress,
      labelText: labelTextemail ?? 'Email Address',
      validator: emailvalidatorFun ?? emailValidator,
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
