import 'package:flutter/material.dart';

class AssuntoPage extends StatefulWidget {
  const AssuntoPage({Key? key}) : super(key: key);

  @override
  _AssuntoPageState createState() => _AssuntoPageState();
}

class _AssuntoPageState extends State<AssuntoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff180c36),
      ),
      body: const Center(
        child: Text(
          'textotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotextotexto',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
