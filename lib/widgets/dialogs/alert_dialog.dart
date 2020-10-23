import 'package:flutter/material.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_svg/svg.dart';

void showAlertDialog(BuildContext _context, String _icon, String _title,
    String _descriptions, String _button) {
  showDialog(
      context: _context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 10),
                          blurRadius: 10),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      _descriptions,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            _button,
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: ColorPalette.mainRedColor,
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: SvgPicture.asset("assets/icons/ic_error.svg", color: Colors.white, width: 40,)),
                ),
              ),
            ],
          ),
        );
      });
}
