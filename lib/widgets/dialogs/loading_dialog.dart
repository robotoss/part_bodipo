import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bodipo/widgets/layers/up_layer.dart';

void showLoadingDialog(BuildContext _context) {
  showUpLayer(
      barrierDismissible: false,
      context: _context,
      builder: (context) => WillPopScope(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Center(
              child: Container(
                height: 64,
                width: 64,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.red),
                  ),
                ),
              ),
            ),
          ),
          onWillPop: () async {
            return false;
          }));
}