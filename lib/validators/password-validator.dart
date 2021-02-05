// ignore: file_names
import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(6, errorText: 'Password must be at least 6 digits long'),
  // ignore: unnecessary_raw_strings
  PatternValidator(r'(?=.*?[0-9])',
      errorText: 'Passwords must have at least one number character'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'Passwords must have at least one special character'),
]);

String passwordCon(
  String val,
  String password,
) {
  return MatchValidator(errorText: 'passwords do not match')
      .validateMatch(val, password);
}
