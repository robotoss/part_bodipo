import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bodipo/global/bloc/global_bloc.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';
import 'package:flutter_bodipo/widgets/buttons/main_dark_green_button.dart';
import 'package:flutter_bodipo/widgets/buttons/main_green_button.dart';
import 'package:flutter_bodipo/widgets/dialogs/alert_dialog.dart';
import 'package:flutter_bodipo/widgets/dialogs/loading_dialog.dart';
import 'package:flutter_bodipo/widgets/textfield/auth_textfield.dart';
import 'package:flutter_bodipo/widgets/textfield/helpers/textfields_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            if (state.isLoading) {
              showLoadingDialog(context);
            } else {
              Navigator.of(context, rootNavigator: true).pop();
            }
          } else if (state is AuthFailureState) {
            showAlertDialog(
                context,
                "ic_error",
                AppLocalizations.of(context).error,
                state.error,
                AppLocalizations.of(context).ok);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previousState, state) {
            if (state is AuthLoadingState) {
              return false;
            } else if (state is AuthFailureState) {
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Scaffold(
                  body: bodyWidget(context),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget bodyWidget(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    head(context),
                    textFields(context),
                    Spacer(),
                    buttons(context)
                  ],
                ),
              ),
            ),
          );
        },
      ));
}

Column head(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
      ),
      Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: ColorPalette.mainGreenColor,
                borderRadius: BorderRadius.circular(12)),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Text(
          AppLocalizations.of(context).wellcome,
          style: ProjectTextStyle.h1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 9.0),
        child: Text(
          AppLocalizations.of(context).signInToContinue,
          style: ProjectTextStyle.subTitle,
        ),
      ),
    ],
  );
}

Form textFields(BuildContext context) {
  return Form(
    key: context.bloc<AuthBloc>().formKey,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AuthTextField(
            textController: context.bloc<AuthBloc>().loginTextController,
            focusNode: context.bloc<AuthBloc>().loginFocusNode,
            title: AppLocalizations.of(context).login,
            textfieldType: TextInputFormatType.LOGIN,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AuthTextField(
            textController: context.bloc<AuthBloc>().passwordTextController,
            focusNode: context.bloc<AuthBloc>().passwordFocusNode,
            title: AppLocalizations.of(context).password,
            textfieldType: TextInputFormatType.PASSWORD,
          ),
        )
      ],
    ),
  );
}

Column buttons(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 25, right: 30),
        child: MainGreenButton(
            title: AppLocalizations.of(context).signIn,
            func: () => context.bloc<AuthBloc>().add(AuthButtonPressedEvent(
                globalBloc: context.bloc<GlobalBloc>()))),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18, right: 30),
        child: Center(
          child: Text(
            AppLocalizations.of(context).forgotPassword,
            style: ProjectTextStyle.grayText,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, bottom: 30),
        child: MainDarkGreenButton(
            title: AppLocalizations.of(context).createAnAccount, func: () {}),
      ),
    ],
  );
}
