import 'package:flutter/material.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/login.dart';
import 'package:profile/pages/navigasi.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/pages/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _cekLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      routes: {
        '/login': (context) => const LoginPage(),
      },
      home: FutureBuilder<bool>(
        future: _cekLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data == true) {
            return const MainNavigation();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
