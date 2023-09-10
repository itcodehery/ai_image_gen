import 'package:ai_integrated_app/pages/home.dart';
import 'package:flutter/material.dart';

class OpticBrainMain extends StatefulWidget {
  const OpticBrainMain({Key? key}) : super(key: key);

  @override
  OpticBrainMainState createState() => OpticBrainMainState();
}

class OpticBrainMainState extends State<OpticBrainMain> {
  final bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: !isDarkMode
            ? const ColorScheme.light(
                background: Colors.white,
                error: Colors.red,
                primary: Colors.purpleAccent,
                onPrimary: Colors.white70,
                onError: Colors.white,
                outline: Colors.purple,
              )
            : const ColorScheme.dark(
                background: Color.fromARGB(255, 29, 25, 36),
                error: Colors.redAccent,
                primary: Color.fromARGB(255, 138, 25, 158),
                onPrimary: Colors.white70,
                onError: Colors.white,
                outline: Color.fromARGB(255, 160, 24, 184),
              ),
      ),
      home: const Home(),
    );
  }
}
