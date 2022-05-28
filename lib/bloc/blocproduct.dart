import 'package:blocs/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product.dart';

abstract class BlocEvent {}

class AddToCart extends BlocEvent {
  Product? prd;
  AddToCart({this.prd});
}

class DelCart extends BlocEvent {
  Product? prd;
  DelCart({this.prd});
}

class ProductBloc extends Bloc<BlocEvent, BlocState> {
  ProductBloc() : super(SuccessState(product: [])) {
    on<BlocEvent>((event, emit) {});
  }
  List<Product> cartProducts = [];

  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    yield LoadingState();
    try {
      if (event is AddToCart) cartProducts.add(event.prd!);

      if (event is DelCart) cartProducts.remove(event.prd);

      yield SuccessState(product: cartProducts);
    } on Error catch (e) {
      yield FailState(fail: e);
    }
  }
}
