import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/eat_main_bloc.dart';


class EatMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EatMainBloc>(
      create: (BuildContext context) => EatMainBloc()..add(InitialEatMainDataEvent()),
      child: BlocBuilder<EatMainBloc, EatMainState>(builder: (context, state) {
        return Scaffold(appBar: AppBar(), body: bodyWidget(context, state));
      }),
    );
  }

  Widget bodyWidget(BuildContext context, EatMainState _state) {
    return Builder(builder: (context) {
      if (_state is EatMainInitialState) {
        return Text('Тут  тело при данных');
      } else if (_state is NewsLoadingState) {
        return Text('Тут  тело при загрузки типо индикатора');
      } else {
        return Container();
      }
    });
  }
}