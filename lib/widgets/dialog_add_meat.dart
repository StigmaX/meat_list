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
      title: Center(
        child: Text(
          title,
          style: AppStyles.dialogTitle(context),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: TextEditingController(text: name),
                onChanged: (value) => name = value,
                decoration: AppStyles.hintText(Icons.abc, 'Meat Name', 'Name')),
            TextField(
                controller: TextEditingController(text: image),
                onChanged: (value) => image = value,
                decoration:
                    AppStyles.hintText(Icons.image, 'Image Path', 'image')),
            TextField(
                controller: TextEditingController(text: desc),
                onChanged: (value) => desc = value,
                decoration: AppStyles.hintText(
                    Icons.description, 'Meat Description', 'Desc'))
          ],
        ),
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
