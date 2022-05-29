import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/blocproduct.dart';
import 'bloc/blocstate.dart';
import 'bloc/bloctheme.dart';
import 'mudole/theme.dart';
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
    return BlocBuilder<BlocTheme, BlocState>(builder: (_, state) {
      return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme:
              appThemeData[state is ThemeState ? state.theme : AppTheme.light],
          home: const Home());
    });
  }
}
