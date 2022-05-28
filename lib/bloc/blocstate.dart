import '../model/product.dart';

abstract class BlocState {}

class Initial extends BlocState {}

class LoadingState extends BlocState {}

class SuccessState extends BlocState {
  List<Product> product;
  SuccessState({required this.product});
}

class FailState extends BlocState {
  Error fail;
  FailState({required this.fail});
}

class LoadedState extends BlocState {
  List<Product> products;
  LoadedState({required this.products});
}
