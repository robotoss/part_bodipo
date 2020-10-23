import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'global/bloc/global_bloc.dart';
import 'screens/auth/auth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/main/bloc/main_part_bloc.dart';
import 'screens/main/main_part.dart';
import 'styles/main_theme.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GlobalBloc>(create: (BuildContext context) => GlobalBloc()),
      BlocProvider<MainPartBloc>(
        create: (BuildContext context) => MainPartBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Bodipo',
      theme: defaultTheme,
      home: BlocProvider(
        create: (context) => GlobalBloc()..add(AppStartedEvent()),
        child: BlocBuilder<GlobalBloc, GlobalState>(
          builder: (context, state) {
            if (state is UninitializedState) {
              return Text('123');
            } else if (state is AuthenticatedState) {
              return MainPart();
            } else if (state is UnauthenticatedState) {
              return AuthScreen();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
