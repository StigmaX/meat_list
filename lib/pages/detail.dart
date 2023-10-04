import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/widgets/app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.meat});

  final Meat meat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarsDetail(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(meat.name),
          Image.memory(base64Decode(meat.image)),
          Text(meat.description),
        ],
      ),
    );
  }
}
