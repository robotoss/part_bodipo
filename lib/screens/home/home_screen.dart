import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bodipo/global/bloc/global_bloc.dart';
import 'package:flutter_bodipo/widgets/buttons/main_green_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: MainGreenButton(
              title: AppLocalizations.of(context).logout,
              func: () {
                context.bloc<GlobalBloc>().add(LoggedOutEvent());
              }),
        ),
      ),
    );
  }
}
