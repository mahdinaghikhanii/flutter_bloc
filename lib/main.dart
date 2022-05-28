import 'dart:js';

import 'package:blocs/bloc/blocstate.dart';
import 'package:blocs/bloc/bloctheme.dart';
import 'package:blocs/mudole/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocproduct.dart';
import 'views/home.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<BlocTheme>(create: (context) => BlocTheme()),
    BlocProvider<ProductBloc>(create: (context) => ProductBloc())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocTheme, BlocState>(
        builder: (BuildContext context, state) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: appThemeData[
              state is ChangeTheme ? state.themeData : AppTheme.light],
          home: const Home());
    });
  }
}
