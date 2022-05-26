import 'package:flutter/material.dart';

import 'bloc/bloccounter.dart';
import 'bloc/blocevent.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<int>(
            initialData: 0,
            stream: _counterBloc.counter,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return Column(
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text('${snapshot.data}',
                      style: Theme.of(context).textTheme.subtitle1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () => _counterBloc.counterEventSink
                            .add(CounterEvent.incerment),
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                      ),
                      const SizedBox(width: 10),
                      FloatingActionButton(
                        onPressed: () => _counterBloc.counterEventSink
                            .add(CounterEvent.decerment),
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
