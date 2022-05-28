import 'package:blocs/mudole/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocproduct.dart';
import 'blocstate.dart';

class BlocTheme extends Bloc<BlocEvent, BlocState> {
  BlocTheme() : super(Initial());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    try {
      if (state is ThemeEvents) yield ChangeTheme(themeData: AppTheme.light);
    } on Error catch (e) {
      FailState(fail: e);
    }
  }
}
