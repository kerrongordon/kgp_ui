import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/core/base_email_form_field.dart';
import 'package:kgp_ui/core/base_password_form_field.dart';

import '../base_screen.dart';
import '../../components/base_footer_auth.dart';
import '../../validators/password-validator.dart';

class BaseRegisterAuth extends HookWidget {
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

  BaseRegisterAuth({
    this.pageTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.labelTextpassword,
    this.passwordvalidatorFun,
    this.labelTextpasswordConfrom,
    this.passwordvalidatorConfromFun,
  });

  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _email = useState<String>();
    final _password = useState<String>();
    final _passwordCon = useState<String>();
    final _passwordOnChange = useState<String>();

    final _emailFoce = useFocusNode();
    final _passwordFoce = useFocusNode();
    final _passwordConFoce = useFocusNode();
    final _submitFoce = useFocusNode();

    return Scaffold(
      body: BaseScreen(
        title: pageTitle ?? 'Register',
        titleColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _registerKey,
            child: Column(
              children: [
                BaseEmailFormField(
                  labelTextemail: labelTextemail,
                  emailvalidatorFun: emailvalidatorFun,
                  onSaved: (val) => _email.value = val,
                  focusNode: _emailFoce,
                  nextFocusNode: _passwordFoce,
                ),
                BasePasswordFormField(
                  labelTextpassword: labelTextpassword,
                  passwordvalidatorFun: passwordvalidatorFun,
                  onSaved: (val) => _password.value = val,
                  onChanged: (val) => _passwordOnChange.value = val,
                  focusNode: _passwordFoce,
                  nextFocusNode: _passwordConFoce,
                ),
                BasePasswordFormField(
                  labelTextpassword: labelTextpasswordConfrom,
                  passwordvalidatorFun: (val) =>
                      passwordCon(val, _passwordOnChange.value),
                  onSaved: (val) => _passwordCon.value = val,
                  focusNode: _passwordConFoce,
                  nextFocusNode: _submitFoce,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 30),
                  child: ElevatedButton.icon(
                    focusNode: _submitFoce,
                    icon: Icon(Icons.assignment),
                    label: Text('Register'),
                    onPressed: () {
                      if (!_registerKey.currentState.validate()) return;

                      _registerKey.currentState.save();

                      print(_email.value);
                      print(_password.value);
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
