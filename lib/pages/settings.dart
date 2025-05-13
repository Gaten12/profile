import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.purple[800],
      ),
      body: const Center(
        child: Text(
          'dummy saja',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
