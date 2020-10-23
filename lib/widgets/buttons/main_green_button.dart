import 'package:flutter/material.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';

class MainGreenButton extends StatelessWidget {
  final String title;
  final Function func;
  const MainGreenButton({Key key, @required this.title, @required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: func,
        child: Text(
          title,
          style: ProjectTextStyle.buttonWhiteText,
        ),
        style: OutlinedButton.styleFrom(
              backgroundColor: ColorPalette.mainGreenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
