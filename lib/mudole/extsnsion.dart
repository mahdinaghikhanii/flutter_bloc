import 'package:blocs/bloc/bloctheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ExtensionContext on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  BlocTheme get themeBloc => read<BlocTheme>();
}
