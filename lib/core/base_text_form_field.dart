import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextFormField extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final String errorText;
  final String initialValue;
  final Widget prefixIcon;
  final bool obscureText;
  final bool enabled;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function(String) onFieldSubmitted;
  final bool autocorrect;
  final Iterable<String> autofillHints;
  final Widget Function(
    BuildContext, {
    int currentLength,
    bool isFocused,
    int maxLength,
  }) buildCounter;
  final Color cursorColor;

  const BaseTextFormField({
    Key key,
    @required this.labelText,
    @required this.prefixIcon,
    this.prefixText,
    bool obscureText,
    @required this.keyboardType,
    this.controller,
    this.inputFormatters,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.enabled,
    this.errorText,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.autocorrect = true,
    this.autofillHints,
    this.buildCounter,
    this.cursorColor,
  })  : obscureText = obscureText ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -3.9,
            left: -3.8,
            right: -3.8,
            child: Card(
              child: Container(
                padding: const EdgeInsets.only(bottom: 48),
              ),
            ),
          ),
          TextFormField(
            key: key,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: enabled,
            initialValue: initialValue,
            autocorrect: autocorrect,
            autofillHints: autofillHints,
            buildCounter: buildCounter,
            cursorColor: cursorColor,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            validator: validator,
            onSaved: onSaved,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              helperText: '',
              prefixIcon: prefixIcon,
              errorText: errorText,
              fillColor: Theme.of(context).cardTheme.color,
              prefixText: prefixText,
              contentPadding: EdgeInsets.zero,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
