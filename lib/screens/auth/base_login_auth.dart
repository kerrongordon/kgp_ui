import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../components/base_footer_auth.dart';
import '../../core/base_email_form_field.dart';
import '../../core/base_password_form_field.dart';
import '../../screens/base_screen.dart';

/// Kgp UI Base Login Screen
class BaseLoginAuth extends StatefulWidget {
  /// Page Text Title "Sign In"
  final String pageTitle;

  /// Email Text Title "Email Address"
  final String labelTextemail;

  /// Email Validator using MultiValidator
  final MultiValidator emailvalidatorFun;

  /// Password Text Title "Password"
  final String labelTextpassword;

  /// Password Validator using MultiValidator
  final MultiValidator passwordvalidatorFun;

  /// Password Rest Button route
  final void Function() passwordResetBtn;

  /// Register Button route
  final void Function() registerBtn;

  /// Remember Me Text title "Remember Me"
  final String labelTextRememberMe;

  /// Forgot Password Text title "Forgot Password?"
  final String labelTextForgotPassword;

  /// Sign In Text title "Sign In"
  final String labelTextSignIn;

  /// Register Text title "Register"
  final String labelTextRegister;

  /// Register detail Text title "Don\'t Have an Account?"
  final String labelTextRegisterdetail;

  /// Sign In Function Button
  /// GlobalKey<FormState> loginKey,
  /// String email,
  /// String password,
  /// bool rememberMe,
  /// BuildContext context,
  final void Function({
    GlobalKey<FormState> loginKey,
    String email,
    String password,
    bool rememberMe,
    BuildContext context,
  }) onSignInBtn;

  const BaseLoginAuth({
    Key key,
    this.pageTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.labelTextpassword,
    this.passwordvalidatorFun,
    this.passwordResetBtn,
    this.registerBtn,
    this.labelTextRememberMe,
    this.labelTextForgotPassword,
    this.labelTextSignIn,
    this.onSignInBtn,
    this.labelTextRegister,
    this.labelTextRegisterdetail,
  }) : super(key: key);

  @override
  State<BaseLoginAuth> createState() => _BaseLoginAuthState();
}

class _BaseLoginAuthState extends State<BaseLoginAuth> {
  final _loginKey = GlobalKey<FormState>();

  bool _rememberMe = true;
  String _email;
  String _password;

  FocusNode _emailFoce;
  FocusNode _passwordFoce;
  FocusNode _submitFoce;

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
    _emailFoce = FocusNode();
    _passwordFoce = FocusNode();
    _submitFoce = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _email = '';
    _password = '';
    _emailFoce.dispose();
    _passwordFoce.dispose();
    _submitFoce.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        title: widget.pageTitle ?? 'Sign In',
        titleColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _loginKey,
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
                  focusNode: _passwordFoce,
                  nextFocusNode: _submitFoce,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Switch(
                            onChanged: (val) => _rememberMe = val,
                            value: _rememberMe,
                          ),
                          TextButton(
                            onPressed: () => _rememberMe = !_rememberMe,
                            child: Text(
                                widget.labelTextRememberMe ?? 'Remember Me'),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: widget.passwordResetBtn,
                        child: Text(widget.labelTextForgotPassword ??
                            'Forgot Password?'),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 30),
                    child: ElevatedButton.icon(
                      focusNode: _submitFoce,
                      icon: const Icon(Icons.vpn_key),
                      label: Text(widget.labelTextSignIn ?? 'Sign In'),
                      onPressed: () => widget.onSignInBtn(
                        loginKey: _loginKey,
                        email: _email,
                        password: _password,
                        rememberMe: _rememberMe,
                        context: context,
                      ),
                    ),
                  ),
                ),
                FooterAuth(
                  action: widget.labelTextRegister ?? 'Register',
                  detail: widget.labelTextRegisterdetail ??
                      "Don't Have an Account?",
                  onTap: widget.registerBtn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
