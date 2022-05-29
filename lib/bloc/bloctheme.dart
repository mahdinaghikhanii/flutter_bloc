import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mudole/theme.dart';
import 'blocstate.dart';

class BlocTheme extends Cubit<ThemeState> {
  BlocTheme() : super(ThemeState(AppTheme.light)) {
    loadtheme();
  }

  void loadtheme() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    String str = prfs.getString('theme') ?? '';
    if (str == 'dark') emit(ThemeState(AppTheme.dark));
  }

  void setTheme(AppTheme appTheme) async {
    emit(ThemeState(appTheme));
    await SharedPreferences.getInstance().then((value) =>
        value.setString('theme', appTheme == AppTheme.dark ? 'dark' : 'light'));
  }
}
