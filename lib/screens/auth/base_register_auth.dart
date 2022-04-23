import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/core/base_email_form_field.dart';
import 'package:kgp_ui/core/base_password_form_field.dart';

import '../../components/base_footer_auth.dart';
import '../../validators/password-validator.dart';
import '../base_screen.dart';

class BaseRegisterAuth extends StatefulWidget {
  /// Page Text Title "Register"
  final String pageTitle;

  /// Email Text Title "Email Address"
  final String labelTextemail;

  /// Email Validator using MultiValidator
  final MultiValidator emailvalidatorFun;

  /// Password Text Title "Password"
  final String labelTextpassword;

  /// Password Validator using MultiValidator
  final MultiValidator passwordvalidatorFun;

  /// Password Text Title "Password"
  final String labelTextpasswordConfrom;

  /// Password Validator using MultiValidator
  final MultiValidator passwordvalidatorConfromFun;

  const BaseRegisterAuth({
    Key key,
    this.pageTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.labelTextpassword,
    this.passwordvalidatorFun,
    this.labelTextpasswordConfrom,
    this.passwordvalidatorConfromFun,
  }) : super(key: key);

  @override
  State<BaseRegisterAuth> createState() => _BaseRegisterAuthState();
}

class _BaseRegisterAuthState extends State<BaseRegisterAuth> {
  final _registerKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _passwordCon;
  String _passwordOnChange;

  FocusNode _emailFoce;
  FocusNode _passwordFoce;
  FocusNode _passwordConFoce;
  FocusNode _submitFoce;

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
    _passwordCon = '';
    _passwordOnChange = '';
    _emailFoce = FocusNode();
    _passwordFoce = FocusNode();
    _passwordConFoce = FocusNode();
    _submitFoce = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _email = '';
    _password = '';
    _passwordCon = '';
    _passwordOnChange = '';
    _emailFoce.dispose();
    _passwordFoce.dispose();
    _passwordConFoce.dispose();
    _submitFoce.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        title: widget.pageTitle ?? 'Register',
        titleColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _registerKey,
            child: Column(
              children: [
                BaseEmailFormField(
                  labelTextemail: widget.labelTextemail,
                  emailvalidatorFun: widget.emailvalidatorFun,
                  onSaved: (val) => _email = val,
                  focusNode: _emailFoce,
                  nextFocusNode: _passwordFoce,
                ),
                BasePasswordFormField(
                  labelTextpassword: widget.labelTextpassword,
                  passwordvalidatorFun: widget.passwordvalidatorFun,
                  onSaved: (val) => _password = val,
                  onChanged: (val) => _passwordOnChange = val,
                  focusNode: _passwordFoce,
                  nextFocusNode: _passwordConFoce,
                ),
                BasePasswordFormField(
                  labelTextpassword: widget.labelTextpasswordConfrom,
                  passwordvalidatorFun: (val) =>
                      passwordCon(val, _passwordOnChange),
                  onSaved: (val) => _passwordCon = val,
                  focusNode: _passwordConFoce,
                  nextFocusNode: _submitFoce,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 30),
                  child: ElevatedButton.icon(
                    focusNode: _submitFoce,
                    icon: const Icon(Icons.assignment),
                    label: const Text('Register'),
                    onPressed: () {
                      if (!_registerKey.currentState.validate()) return;

                      _registerKey.currentState.save();

                      // ignore: avoid_print
                      print(_email);
                      // ignore: avoid_print
                      print(_password);
                      // ignore: avoid_print
                      print(_passwordCon);
                      _registerKey.currentState.reset();
                    },
                  ),
                ),
                FooterAuth(
                  action: 'Sign In',
                  detail: 'Already a member?',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
