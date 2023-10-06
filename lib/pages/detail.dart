import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meat_list/data/app_style.dart';
import 'package:meat_list/data/meat.dart';
import 'package:meat_list/widgets/app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.meat});

  final Meat meat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarsDetail(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                meat.name,
                style: AppStyles.titleDescStyle(context),
              ),
            ),
            //image
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                  gradient: AppStyles.gradient(context, 0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.memory(
                  base64Decode(meat.image),
                  fit: BoxFit.cover,
                  height: 250,
                ),
              ),
            ),
            //description
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                    child: SingleChildScrollView(child: Text(meat.description)),
                  ),
                  Positioned(
                    top: 12,
                    left: 50,
                    child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: const Text(
                        'Description',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
