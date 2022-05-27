import 'package:blocs/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.shopping_cart),
              ),
            ),
            const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 12,
                  child: Text(
                    '12',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                )),
          ],
        ),
        title: const Text('Shopping Create with Bloc'),
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
                                    onPressed: () {},
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
