import 'package:flutter/material.dart';

class AppStyles {
  static titleStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  static descStyle() {
    const TextStyle(
      color: Colors.white70,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static appBarStyle(BuildContext context) {
    return const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  static hintText(icon, String label) {
    return InputDecoration(
      labelText: label,
      icon: Icon(icon),
    );
  }

  static dialogTitle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
  }
}
