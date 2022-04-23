import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/core/base_text_form_field.dart';
import 'package:kgp_ui/utils/field-focus-change.dart';
import 'package:kgp_ui/validators/password-validator.dart';

class BasePasswordFormField extends StatelessWidget {
  final String labelTextpassword;
  final MultiValidator passwordvalidatorFun;
  final void Function(String?) onSaved;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final void Function(String?)? onChanged;

  const BasePasswordFormField({
    Key? key,
    this.labelTextpassword = 'Password',
    required this.passwordvalidatorFun,
    required this.onSaved,
    required this.focusNode,
    required this.nextFocusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: const Icon(Icons.fingerprint),
      keyboardType: TextInputType.text,
      labelText: labelTextpassword,
      obscureText: true,
      validator: passwordValidator,
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
