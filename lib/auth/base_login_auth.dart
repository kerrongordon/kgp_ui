// import 'package:flutter/material.dart';
// import 'package:handys/routes/routes.dart';

part of kgp_ui;

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
  /// BuildContext context,
  final void Function({
    GlobalKey<FormState> loginKey,
    String email,
    String password,
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
    final rememberMe = useState<bool>(true);
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
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _loginKey,
            child: Column(
              children: [
                BaseTextFormField(
                  prefixIcon: Icon(Icons.alternate_email),
                  keyboardType: TextInputType.emailAddress,
                  labelText: labelTextemail ?? 'Email Address',
                  validator: emailvalidatorFun ?? emailValidator,
                  onSaved: (val) => _email.value = val,
                  focusNode: _emailFoce,
                  onFieldSubmitted: (val) =>
                      fieldFocusChange(context, _emailFoce, _passwordFoce),
                ),
                BaseTextFormField(
                  prefixIcon: Icon(Icons.fingerprint),
                  keyboardType: TextInputType.text,
                  labelText: labelTextpassword ?? 'Password',
                  obscureText: true,
                  validator: passwordvalidatorFun ?? passwordValidator,
                  onSaved: (val) => _password.value = val,
                  focusNode: _passwordFoce,
                  onFieldSubmitted: (val) =>
                      fieldFocusChange(context, _passwordFoce, _submitFoce),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Switch(
                            onChanged: (val) => rememberMe.value = val,
                            value: rememberMe.value,
                          ),
                          TextButton(
                            child: Text(labelTextRememberMe ?? 'Remember Me'),
                            onPressed: () =>
                                rememberMe.value = !rememberMe.value,
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
