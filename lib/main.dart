import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider_demo.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider(
          create: (context) => DemoProvider(),
          builder: (ctx, child) {
            print('Change notifier rebuilding');
            final _demo = ctx.read<DemoProvider>();
            return Container(
              height: 300,
              decoration: BoxDecoration(
                border: _demo.loggedIn
                    ? Border.all(color: Colors.green)
                    : Border.all(color: Colors.red),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child!,
                  ElevatedButton(
                      onPressed: () {
                        _demo.updateLog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<DemoProvider>(
                          builder: (context, value, child) => Row(
                            children: [
                              child!,
                              Text(
                                value.loggedIn ? 'Log out' : 'Log In',
                              ),
                            ],
                          ),
                          child: Builder(builder: (context) {
                            print('Consumer\'s child is rebuilding');
                            return Icon(
                              Icons.ac_unit_rounded,
                              color: _demo.loggedIn ? Colors.green : Colors.red,
                            );
                          }),
                        ),
                      ))
                ],
              ),
            );
          },
          child: Builder(builder: (context) {
            final _demo = context.read<DemoProvider>();

            print('Text is rebuilding');
            return const Text('1 dthis doesn\'t change');
          }),
        ),
      ),
    );
  }
}
