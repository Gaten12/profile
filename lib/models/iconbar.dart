import 'package:flutter/material.dart';

class IconBar extends StatelessWidget {
  const IconBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.article, color: Colors.white),
        Icon(Icons.lock_outline, color: Colors.white),
        Icon(Icons.inventory_2, color: Colors.white),
        Icon(Icons.link, color: Colors.white),
        Icon(Icons.favorite_border, color: Colors.white),
      ],
    );
  }
}