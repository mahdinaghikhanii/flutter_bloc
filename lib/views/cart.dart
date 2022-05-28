import 'package:blocs/bloc/blocproduct.dart';
import 'package:blocs/bloc/blocstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: BlocBuilder<ProductBloc, BlocState>(
                    builder: (context, state) => state is LoadingState
                        ? const CupertinoActivityIndicator()
                        : state is FailState
                            ? const Center(child: Text(''))
                            : state is SuccessState
                                ? ListView.builder(
                                    itemCount: state.product.length,
                                    itemBuilder: (context, index) {
                                      return Container();
                                    })
                                : Container()))));
  }
}
