import 'package:flutter/cupertino.dart';
import 'package:flutter_bodipo/widgets/textfield/helpers/textfields_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String switchValidation(
  BuildContext context,
  TextInputFormatType fieldType,
  String value,
) {
  String _error;
  switch (fieldType) {
    case TextInputFormatType.LOGIN:
      {
        if (value.isEmpty) {
          _error = AppLocalizations.of(context).errorEmptyField;
        }
      }
      break;
    case TextInputFormatType.PASSWORD:
      {
        if (value.isEmpty) {
          _error = AppLocalizations.of(context).errorEmptyField;
        }
      }
      break;
  }
  return _error;
}
