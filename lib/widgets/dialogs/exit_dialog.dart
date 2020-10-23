import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void exitDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text(
            AppLocalizations.of(context).exitText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async => Navigator.of(context).pop(false),
              child: Text(AppLocalizations.of(context).cancel,
                  style: ProjectTextStyle.exitDialogButtonCancel),
            ),
            CupertinoDialogAction(
                onPressed: () async {
                  Navigator.of(context, rootNavigator: true).pop(true);
                  SystemChannels.platform
                      .invokeMethod<void>('SystemNavigator.pop');
                },
                isDefaultAction: false,
                child: Text(AppLocalizations.of(context).exit,
                    style: ProjectTextStyle.exitDialogButtonExit)),
          ],
        );
      });
}
