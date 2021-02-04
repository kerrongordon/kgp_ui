import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../screens/base_screen.dart';
import '../../core/base_email_form_field.dart';
import '../../core/base_password_form_field.dart';
import '../../components/base_footer_auth.dart';

/// Kgp UI Base Login Screen
class BaseLoginAuth extends HookWidget {
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

  BaseLoginAuth({
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
  });

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _rememberMe = useState<bool>(true);
    final _email = useState<String>();
    final _password = useState<String>();

    final _emailFoce = useFocusNode();
    final _passwordFoce = useFocusNode();
    final _submitFoce = useFocusNode();

    return Scaffold(
      body: BaseScreen(
        title: pageTitle ?? 'Sign In',
        titleColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).accentColor,
        iconTheme: IconThemeData(color: Colors.white),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _loginKey,
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
                            onChanged: (val) => _rememberMe.value = val,
                            value: _rememberMe.value,
                          ),
                          TextButton(
                            child: Text(labelTextRememberMe ?? 'Remember Me'),
                            onPressed: () =>
                                _rememberMe.value = !_rememberMe.value,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child:
                            Text(labelTextForgotPassword ?? 'Forgot Password?'),
                        onPressed: passwordResetBtn,
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 30),
                    child: ElevatedButton.icon(
                      focusNode: _submitFoce,
                      icon: Icon(Icons.vpn_key),
                      label: Text(labelTextSignIn ?? 'Sign In'),
                      onPressed: () => onSignInBtn(
                        loginKey: _loginKey,
                        email: _email.value,
                        password: _password.value,
                        rememberMe: _rememberMe.value,
                        context: context,
                      ),
                    ),
                  ),
                ),
                FooterAuth(
                  action: labelTextRegister ?? 'Register',
                  detail: labelTextRegisterdetail ?? 'Don\'t Have an Account?',
                  onTap: registerBtn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
