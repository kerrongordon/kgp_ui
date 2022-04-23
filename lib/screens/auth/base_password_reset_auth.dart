import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/components/base_footer_auth.dart';
import 'package:kgp_ui/core/base_text_form_field.dart';
import 'package:kgp_ui/screens/base_screen.dart';
import 'package:kgp_ui/utils/field-focus-change.dart';
import 'package:kgp_ui/validators/email-validator.dart';

/// Kgp UI Base Password Rest
class BasePasswordRestAuth extends StatefulWidget {
  /// Page Text Title "Password Rest"
  final String pageTitle;

  /// Page Text SubTitle "Password Rest"
  final String? pageSubTitle;

  /// Email Text Title "Email Address"
  final String? labelTextemail;

  /// Email Validator using MultiValidator
  final MultiValidator? emailvalidatorFun;

  /// Sign In Text title "Send"
  final String? labelTextSend;

  /// Register Text title "Sign In"
  final String? labelTextSignIn;

  /// Register detail Text title "Rmember your Password?"
  final String? labelTextSignIndetail;

  /// Send Email Function Button
  /// GlobalKey<FormState> loginKey,
  /// String email,
  /// BuildContext context,
  final void Function({
    GlobalKey<FormState> resetKey,
    String email,
    BuildContext context,
  })? onSendBtn;

  const BasePasswordRestAuth({
    Key? key,
    this.pageTitle = 'Forgot Your Password?',
    this.pageSubTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.labelTextSend,
    this.labelTextSignIn,
    this.labelTextSignIndetail,
    this.onSendBtn,
  }) : super(key: key);

  @override
  State<BasePasswordRestAuth> createState() => _BasePasswordRestAuthState();
}

class _BasePasswordRestAuthState extends State<BasePasswordRestAuth> {
  final _resetKey = GlobalKey<FormState>();

  late String _email;
  late FocusNode _emailFoce;
  late FocusNode _submitFoce;

  @override
  void initState() {
    super.initState();
    _email = '';
    _emailFoce = FocusNode();
    _submitFoce = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _email = '';
    _emailFoce.dispose();
    _submitFoce.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        title: widget.pageTitle,
        titleColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Theme.of(context).primaryColor,
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
                    widget.pageSubTitle ??
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
                  labelText: widget.labelTextemail ?? 'Email address',
                  validator: widget.emailvalidatorFun ?? emailValidator,
                  onSaved: (val) => _email = val!,
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
                      label: Text(widget.labelTextSend ?? 'Send'),
                      onPressed: () => widget.onSendBtn!(
                        resetKey: _resetKey,
                        email: _email,
                        context: context,
                      ),
                    ),
                  ),
                ),
                FooterAuth(
                  action: widget.labelTextSignIn ?? 'Sign In',
                  detail:
                      widget.labelTextSignIndetail ?? 'Rmember your Password?',
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
