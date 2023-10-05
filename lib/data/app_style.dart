import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  //listTile
  static listTitle(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      shadows: <Shadow>[
        Shadow(
            offset: const Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Theme.of(context).colorScheme.primary),
      ],
    );
  }

  static listSubTitle(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
    );
  }

  static toastMessage(String msg) {
    return Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 50);
  }

  static titleDescStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  //lineargradient
  static gradient(BuildContext context, code) {
    switch (code) {
      case 0:
        return LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary
            ]);
      case 1:
        return SweepGradient(
            center: Alignment.center,
            startAngle: 0,
            endAngle: 3.14,
            colors: [
              Theme.of(context).colorScheme.onPrimary,
              Theme.of(context).colorScheme.primary
            ]);
      case 2:
        return RadialGradient(
            center: Alignment.center,
            tileMode: TileMode.mirror,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.onPrimary
            ]);
    }
  }
}
