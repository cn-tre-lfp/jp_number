import 'package:flutter/material.dart';

import 'a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Focus(
          onKey: (FocusNode node, RawKeyEvent event) {
            if (event.character != null && RegExp(r'[a-zA-Z]').hasMatch(event.character!)) {
              print('拦截了字母键: ${event.character}');
              return KeyEventResult.handled; // 阻止事件继续传递
            }
            return KeyEventResult.ignored; // 允许事件继续传递
          },
          child: Column(
            children: [
              CustomTextField(),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
