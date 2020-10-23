import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bodipo/screens/eat/eat_main/eat_main_screen.dart';
import 'package:flutter_bodipo/screens/home/home_screen.dart';
import 'package:flutter_bodipo/screens/news/news_screen.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/widgets/dialogs/exit_dialog.dart';
import 'package:flutter_svg/svg.dart';

import 'bloc/main_part_bloc.dart';

class MainPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPartBloc>.value(
      value: BlocProvider.of<MainPartBloc>(context),
      child: BlocBuilder<MainPartBloc, MainPartState>(
        builder: (context, state) {
          if (state is MainPartInitialState) {
            return WillPopScope(
              onWillPop: () async {
                bool isPop = !await BlocProvider.of<MainPartBloc>(context)
                    .navigatorKeys[state.indexScreen]
                    .currentState
                    .maybePop();
                if (isPop) {
                  exitDialog(context);
                  return false;
                } else {
                  return false;
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                resizeToAvoidBottomPadding: false,
                extendBody: true,
                body: bodyWidget(context, state),
                bottomNavigationBar: bottomNavBar(context, state),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget bodyWidget(BuildContext context, MainPartInitialState state) {
    return IndexedStack(
      index: state.indexScreen,
      children: <Widget>[
        Navigator(
          key: BlocProvider.of<MainPartBloc>(context).navigatorKeys[0],
          onGenerateRoute: (route) => MaterialPageRoute(
              settings: route, builder: (context) => HomeScreen()),
        ),
        Navigator(
          key: BlocProvider.of<MainPartBloc>(context).navigatorKeys[1],
          onGenerateRoute: (route) => MaterialPageRoute(
            settings: route,
            builder: (context) => EatMainScreen(),
          ),
        ),
        Navigator(
          key: BlocProvider.of<MainPartBloc>(context).navigatorKeys[2],
          onGenerateRoute: (route) => MaterialPageRoute(
              settings: route, builder: (context) => Text('3')),
        ),
        Navigator(
          key: BlocProvider.of<MainPartBloc>(context).navigatorKeys[3],
          onGenerateRoute: (route) => MaterialPageRoute(
              settings: route, builder: (context) => Text('4')),
        ),
        Navigator(
          key: BlocProvider.of<MainPartBloc>(context).navigatorKeys[4],
          onGenerateRoute: (route) => MaterialPageRoute(
              settings: route, builder: (context) => NewsScreen()),
        )
      ],
    );
  }

  Widget bottomNavBar(BuildContext context, MainPartInitialState state) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          border: Border.all(width: 1, color: Colors.transparent),
          color: ColorPalette.mainLightDarkColor,
          boxShadow: [
            BoxShadow(
                color: ColorPalette.shadowColor,
                blurRadius: 14,
                offset: Offset(0, 1)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            menuItem(context, 0, state.indexScreen, 'ic_nav_home.svg'),
            menuItem(context, 1, state.indexScreen, 'ic_nav_eat.svg'),
            menuItem(context, 2, state.indexScreen, 'ic_nav_i.svg'),
            menuItem(context, 3, state.indexScreen, 'ic_nav_search.svg'),
            menuItem(context, 4, state.indexScreen, 'ic_nav_news.svg')
          ],
        ),
      ),
    );
  }

  Widget menuItem(
      BuildContext context, int index, int stateIndex, String icon) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => BlocProvider.of<MainPartBloc>(context)
            .add(ChangeTabEvent(tabIndex: index)),
        child: Container(
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/$icon',
              color: stateIndex == index
                  ? ColorPalette.textGreenColor
                  : ColorPalette.textGrayColor,
            ),
          ),
        ),
      ),
    );
  }
}
