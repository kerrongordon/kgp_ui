import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Name is required'),
  MinLengthValidator(3, errorText: 'Your Name must be at least 3 digits long'),
]);
