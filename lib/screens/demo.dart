import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Screen'),
      ),
      body: Center(
        child: Text(
          'This is a demo screen for registering a widget.',
        ),
      ),
    );
  }
}
