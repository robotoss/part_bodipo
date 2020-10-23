import 'package:flutter/services.dart';
import 'package:flutter_bodipo/widgets/textfield/helpers/textfields_types.dart';

List<TextInputFormatter> switchInputFormat(TextInputFormatType fieldType) {
  List<TextInputFormatter> _format = [];
  switch (fieldType) {
    case TextInputFormatType.LOGIN:
      {
        _format = [];
      }
      break;
    case TextInputFormatType.PASSWORD:
      {
        _format = [];
      }
      break;
  }
  return _format;
}
