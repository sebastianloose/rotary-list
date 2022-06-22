import 'package:flutter/material.dart';
import 'package:rotary_list/rotary_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> elements = [];
    for (int i = 0; i < 100; i++) {
      elements.add(
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: i % 2 == 0 ? Colors.blue : Colors.lightBlue,
          child: Text(
            i.toString(),
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RotaryList(
            children: elements,
          ),
        ),
      ),
    );
  }
}
