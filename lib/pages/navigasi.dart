import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:profile/pages/home.dart';
import 'package:profile/pages/profile.dart';
import 'package:profile/pages/settings.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0; // Menyimpan index navbar

  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
    const SettingsPage(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.person,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai index
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: _currentIndex,
        icons: _icons, // Menggunakan icon yang sudah didefinisikan
        activeColor: Colors.purple,
        inactiveColor: Colors.grey,
        gapLocation: GapLocation.end, // Mengubah gapLocation menjadi 'end'
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengubah index ketika tap
          });
        },
        iconSize: 30, // Sesuaikan ukuran ikon sesuai keinginan
        elevation: 8, // Mengatur bayangan pada navbar
      ),
    );
  }
}
