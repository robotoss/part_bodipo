import 'package:flutter/material.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';

class MainDarkGreenButton extends StatelessWidget {
  final String title;
  final Function func;
  const MainDarkGreenButton(
      {Key key, @required this.title, @required this.func})
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
            style: ProjectTextStyle.buttonGreenText,
          ),
          style: OutlinedButton.styleFrom(
              backgroundColor: ColorPalette.mainDarkGreenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          // color: ColorPalette.mainDarkGreenColor,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ));
  }
}
