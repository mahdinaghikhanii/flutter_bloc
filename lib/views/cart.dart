import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocproduct.dart';
import '../bloc/blocstate.dart';
import '../model/product.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (() =>
                    BlocProvider.of<ProductBloc>(context).add(ClearCart())),
                icon: const Icon(CupertinoIcons.trash))
          ],
          title: const Text('CART'),
        ),
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
                                      Product prd = state.product[index];

                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(children: [
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  prd.picurl,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(child: Text(prd.name)),
                                            Expanded(
                                                child: Row(children: [
                                              Text(
                                                prd.price.toString(),
                                                style: TextStyle(
                                                    color: prd.off > 0
                                                        ? Colors.red
                                                        : Colors.black,
                                                    decoration: prd.off > 0
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              prd.off > 0
                                                  ? Text(prd.off.toString())
                                                  : Container()
                                            ])),
                                            IconButton(
                                                onPressed: () => BlocProvider
                                                        .of<ProductBloc>(
                                                            context)
                                                    .add(DelCart(prd: prd)),
                                                icon: const Icon(
                                                    CupertinoIcons.trash))
                                          ]),
                                        ),
                                      );
                                    })
                                : Container()))));
  }
}
