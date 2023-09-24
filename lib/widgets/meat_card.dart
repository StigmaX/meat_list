import 'package:flutter/material.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/data/text_styles.dart';

class MeatCard extends StatelessWidget {
  const MeatCard({
    super.key,
    required this.meat,
  });

  final Meat meat;

  @override
  Widget build(BuildContext context) {
    double elevation = 0.0;
    return Card(
      color: const Color.fromARGB(220, 173, 0, 0),
      elevation: elevation,
      margin: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  '${meat.image}',
                ),
              ),
            ),
            Text(
              meat.name!,
              style: titleStyle,
            ),
            Text(
              meat.description!,
              style: descStyle,
            ),
          ],
        ),
      ),
    );
  }
}
