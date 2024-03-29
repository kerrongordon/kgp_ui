import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/core/base_text_form_field.dart';
import 'package:kgp_ui/utils/field-focus-change.dart';
import 'package:kgp_ui/validators/email-validator.dart';

class BaseEmailFormField extends StatelessWidget {
  final String labelTextemail;
  final MultiValidator emailvalidatorFun;
  final void Function(String?) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const BaseEmailFormField({
    Key? key,
    this.labelTextemail = 'Email Address',
    required this.emailvalidatorFun,
    required this.onSaved,
    required this.focusNode,
    required this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: const Icon(Icons.alternate_email),
      keyboardType: TextInputType.emailAddress,
      labelText: labelTextemail,
      validator: emailValidator,
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
