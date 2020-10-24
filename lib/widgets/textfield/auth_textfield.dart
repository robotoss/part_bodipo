import 'package:flutter/material.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';
import 'package:flutter_svg/svg.dart';

import 'helpers/switch_input_format.dart';
import 'helpers/switch_keyboard_type.dart';
import 'helpers/switch_validation.dart';
import 'helpers/textfields_types.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode focusNode;
  final String title;
  final TextInputFormatType textfieldType;

  AuthTextField(
      {Key key,
      @required this.textController,
      @required this.focusNode,
      @required this.title,
      @required this.textfieldType})
      : super(key: key);

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  // Скрыть текст
  bool hideText = false;

  @override
  void initState() {
    if (widget.textfieldType == TextInputFormatType.PASSWORD) {
      setState(() {
        hideText = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: TextFormField(
        controller: widget.textController,
        focusNode: widget.focusNode,
        inputFormatters: switchInputFormat(widget.textfieldType),
        style: ProjectTextStyle.textFieldText,
        obscureText: hideText,
        keyboardType: switchInputType(widget.textfieldType),
        validator: (value) {
          return switchValidation(context, widget.textfieldType, value);
        },
        decoration: InputDecoration(
          icon: SvgPicture.asset(
              'assets/icons/${switchIcon(widget.textfieldType)}.svg'),
          suffixIcon: widget.textfieldType == TextInputFormatType.PASSWORD
              ? InkWell(
                  onTap: () {
                    setState(() {
                      hideText = !hideText;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      "assets/icons/${hideText ? "ic_password_hide" : "ic_password_show"}.svg",
                    ),
                  ),
                )
              : null,
          hintText: widget.title,
          hintStyle: ProjectTextStyle.textFieldText,
          border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.textGrayColor, width: 1)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.textGrayColor, width: 1)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorPalette.textGrayColor, width: 1)),
        ),
      ),
    );
  }
}

String switchIcon(TextInputFormatType fieldType) {
  String _icon = 'ic_login';
  switch (fieldType) {
    case TextInputFormatType.LOGIN:
      {
        _icon = 'ic_login';
      }
      break;
    case TextInputFormatType.PASSWORD:
      {
        _icon = 'ic_password';
      }
      break;
  }
  return _icon;
}
