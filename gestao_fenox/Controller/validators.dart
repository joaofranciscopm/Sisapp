import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  Validators._();

  static FormFieldValidator compare(valueController, String message) {
    return (value) {
      final valueCompare = valueController?.text ?? '';
      if (value == null || (value != null && value != valueCompare)) {
        return message;
      }
      return null;
    };
  }
}
