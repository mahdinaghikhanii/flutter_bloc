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
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // ignore: prefer_interpolation_to_compose_strings
                                    Text(snap.data![index].price.toString() +
                                        '\$')
                                  ],
                                ))
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
