import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../components/base_footer_auth.dart';
import '../../core/base_text_form_field.dart';
import '../../screens/base_screen.dart';
import '../../utils/field-focus-change.dart';
import '../../validators/email-validator.dart';

/// Kgp UI Base Password Rest
class BasePasswordRestAuth extends HookWidget {
  /// Page Text Title "Password Rest"
  final String pageTitle;

  /// Page Text SubTitle "Password Rest"
  final String pageSubTitle;

  /// Email Text Title "Email Address"
  final String labelTextemail;

  /// Email Validator using MultiValidator
  final MultiValidator emailvalidatorFun;

  /// Sign In Text title "Send"
  final String labelTextSend;

  /// Register Text title "Sign In"
  final String labelTextSignIn;

  /// Register detail Text title "Rmember your Password?"
  final String labelTextSignIndetail;

  /// Send Email Function Button
  /// GlobalKey<FormState> loginKey,
  /// String email,
  /// BuildContext context,
  final void Function({
    GlobalKey<FormState> resetKey,
    String email,
    BuildContext context,
  }) onSendBtn;

  BasePasswordRestAuth({
    Key key,
    this.pageTitle,
    this.pageSubTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.labelTextSend,
    this.labelTextSignIn,
    this.labelTextSignIndetail,
    this.onSendBtn,
  }) : super(key: key);

  final _resetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _email = useState<String>();
    final _emailFoce = useFocusNode();
    final _submitFoce = useFocusNode();

    return Scaffold(
      body: BaseScreen(
        title: pageTitle ?? 'Forgot Your Password?',
        titleColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: const IconThemeData(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _resetKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45,
                    vertical: 30,
                  ),
                  child: Text(
                    pageSubTitle ??
                        "Don't worry. Resetting your password is easy, just tell us the email address you registered with.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                BaseTextFormField(
                  prefixIcon: const Icon(Icons.alternate_email),
                  keyboardType: TextInputType.emailAddress,
                  labelText: labelTextemail ?? 'Email address',
                  validator: emailvalidatorFun ?? emailValidator,
                  onSaved: (val) => _email.value = val,
                  focusNode: _emailFoce,
                  onFieldSubmitted: (val) =>
                      fieldFocusChange(context, _emailFoce, _submitFoce),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Builder(
                    builder: (BuildContext context) => ElevatedButton.icon(
                      focusNode: _submitFoce,
                      icon: const Icon(Icons.send),
                      label: Text(labelTextSend ?? 'Send'),
                      onPressed: () => onSendBtn(
                        resetKey: _resetKey,
                        email: _email.value,
                        context: context,
                      ),
                    ),
                  ),
                ),
                FooterAuth(
                  action: labelTextSignIn ?? 'Sign In',
                  detail: labelTextSignIndetail ?? 'Rmember your Password?',
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
