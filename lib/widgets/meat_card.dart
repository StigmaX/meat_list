import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';

class MeatCard extends StatelessWidget {
  const MeatCard({
    super.key,
    required this.meat,
  });

  final Meat meat;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Text(meat.name!),
          Image.asset('${meat.image}'),
          Text(meat.description!),
        ],
      ),
    );
  }
}
