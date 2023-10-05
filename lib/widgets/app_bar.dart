import 'package:flutter/material.dart';

import '../data/app_style.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  const AppBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          'Meat List',
          style: AppStyles.appBarStyle(context),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class AppBarsDetail extends StatelessWidget implements PreferredSizeWidget {
  const AppBarsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Meat Detail',
          style: AppStyles.appBarStyle(context),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
