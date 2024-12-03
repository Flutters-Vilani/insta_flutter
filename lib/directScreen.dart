import 'package:flutter/material.dart';

class DirectScreen extends StatefulWidget {
  const DirectScreen({super.key});

  @override
  State<DirectScreen> createState() => _DirectScreenState();
}

class _DirectScreenState extends State<DirectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Tela Direct")),
    );
  }
}
