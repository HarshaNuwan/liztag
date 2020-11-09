import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  String _x = "";
  List<String> _items=[];

  int get count => _count;
  String get x => _x;
  List<String> get items => _items;

  void increment() {
    _count++;
    notifyListeners();
  }

  void changeX(String x) {
    _x = x;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
    //properties.add(StringProperty('x', x));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            const Count(),
            Text('${context.watch<Counter>().x}'),

            Expanded(
                child: ListView.builder(
                    itemCount: context.watch<Counter>().items.length,
                    itemBuilder: (context, index) {
                      return Text('Item with number ${context.read<Counter>().items[index]}');
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(

              /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
              '${context.watch<Counter>().count}',
              style: Theme.of(context).textTheme.headline4)
        ,
          RaisedButton(
            child: Text('Press me'),
            onPressed: (){
              context.read<Counter>().changeX('New text ${context.read<Counter>().count}');
              context.read<Counter>().items.add(' ${context.read<Counter>().count}');
            },
          )
        ],
        
      ),
    );
  }
}
