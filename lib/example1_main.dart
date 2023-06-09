import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Example1Page(),
    );
  }
}

Stream<String> getTime() => Stream.periodic(const Duration(seconds: 1), (_) {
      return DateTime.now().toIso8601String();
    });

class Example1Page extends HookWidget {
  static const String routeName = "example1";
  const Example1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final time = useStream(getTime());
    return Scaffold(
      appBar: AppBar(
        title: Text(time.data ?? "no data"),
      ),
      body: Container(),
    );
  }
}
