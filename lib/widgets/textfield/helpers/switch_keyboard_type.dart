import 'package:flutter/widgets.dart';
import 'package:flutter_bodipo/widgets/textfield/helpers/textfields_types.dart';

TextInputType switchInputType(TextInputFormatType fieldType) {
  TextInputType _keyboard = TextInputType.text;
  switch (fieldType) {
    case TextInputFormatType.LOGIN:
      {
        _keyboard = TextInputType.text;
      }
      break;
    case TextInputFormatType.PASSWORD:
      {
        _keyboard = TextInputType.visiblePassword;
      }
      break;
  }
  return _keyboard;
}
