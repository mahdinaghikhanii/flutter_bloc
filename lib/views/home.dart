import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocproduct.dart';
import '../bloc/blocstate.dart';
import '../model/product.dart';
import '../mudole/widgets.dart';
import 'cart.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20, top: 20),
              child: MDarkLightSwitch())
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Cart()));
                  },
                  icon: const Icon(CupertinoIcons.shopping_cart),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 12,
                      child: BlocBuilder<ProductBloc, BlocState>(
                          builder: (context, state) => Text(
                              '${BlocProvider.of<ProductBloc>(context).cartProducts.length}',
                              style: const TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold)))))
            ],
          ),
        ),
        title: const Text(' Create with Bloc'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder<List<Product>>(
          future: Product.loadData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {},
                          title: SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Image(
                                        image: NetworkImage(
                                            snap.data![index].picurl))),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  snap.data![index].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${snap.data![index].price}\$',
                                      style: TextStyle(
                                          color: snap.data![index].off > 0
                                              ? Colors.red
                                              : Colors.black,
                                          decoration: snap.data![index].off > 0
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    snap.data![index].off > 0
                                        ? Text((snap.data![index].price -
                                                (snap.data![index].price *
                                                    snap.data![index].off))
                                            .toStringAsFixed(2))
                                        : Container()
                                  ],
                                )),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                          AddToCart(prd: snap.data![index]));
                                    },
                                    icon: const Icon(
                                        CupertinoIcons.shopping_cart)),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
            }

            return const Center(
              child: CupertinoActivityIndicator(),
            );
          },
        ),
      )),
    );
  }
}
