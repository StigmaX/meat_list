import 'package:flutter/material.dart';
import 'package:meat_list/data/text_styles.dart';

import '../data/meat.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({
    super.key,
    this.meat,
  });

  final Meat? meat;
  @override
  Widget build(BuildContext context) {
    String? name;
    String? image;
    String? desc;
    String title = 'Add Meat';

    if (meat != null) {
      name = meat?.name;
      image = meat?.image;
      desc = meat?.description;
      title = 'Edit Meat';
    }

    return AlertDialog(
      title: Text(
        title,
        style: AppStyles.dialogTitle(context),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: TextEditingController(text: name),
              onChanged: (value) => name = value,
              decoration: InputDecoration(
                  hintText: 'Meat Name', hintStyle: AppStyles.hintText())),
          TextField(
              controller: TextEditingController(text: image),
              onChanged: (value) => image = value,
              decoration: InputDecoration(
                  hintText: 'Meat Image', hintStyle: AppStyles.hintText())),
          TextField(
              controller: TextEditingController(text: desc),
              onChanged: (value) => desc = value,
              decoration: InputDecoration(
                  hintText: 'Meat Description',
                  hintStyle: AppStyles.hintText()))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop([name, image, desc]);
            },
            child: const Text('Ok')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
      ],
    );
  }
}
