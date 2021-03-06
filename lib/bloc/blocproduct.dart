import 'package:blocs/mudole/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product.dart';
import 'blocstate.dart';

abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Product prd;
  AddToCart({required this.prd});
}

class DelCart extends BlocEvent {
  Product prd;
  DelCart({required this.prd});
}

class ThemeEvents extends BlocEvent {
  final AppTheme theme;

  ThemeEvents({
    required this.theme,
  });
}

class ClearCart extends BlocEvent {}

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc() : super(Initial());
  List<Product> cartProducts = [];

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LoadingState();
    try {
      if (event is AddToCart) cartProducts.add(event.prd);

      if (event is DelCart) cartProducts.remove(event.prd);

      if (event is ClearCart) cartProducts = [];

      yield SuccessState(product: cartProducts);
    } on Error catch (e) {
      yield FailState(fail: e);
    }
  }
}
