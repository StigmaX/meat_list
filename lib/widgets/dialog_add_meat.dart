import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meat_list/data/app_style.dart';

import '../data/meat.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({
    super.key,
    this.meat,
  });

  final Meat? meat;

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  String imagePath = '';
  File? image;

  Future<void> uploadImage() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (result != null) {
        image = File(result.path);
        imagePath = result.name;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String image = '';
    String desc = '';
    String title = 'Add Meat';
    bool enabled = true;

    if (widget.meat != null) {
      name = widget.meat!.name;
      image = widget.meat!.image;
      desc = widget.meat!.description;
      title = 'Edit Meat';
      enabled = false;
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
                enabled: enabled,
                controller: TextEditingController(text: name),
                onChanged: (value) => name = value,
                decoration: AppStyles.hintText(Icons.abc, 'Name')),
            TextField(
                controller: TextEditingController(text: image),
                onChanged: (value) => image = value,
                decoration: AppStyles.hintText(Icons.image, 'image')),
            TextField(
                controller: TextEditingController(text: desc),
                onChanged: (value) => desc = value,
                decoration: AppStyles.hintText(Icons.description, 'Desc')),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: uploadImage, child: const Text('Pick Image')),
                if (imagePath.isNotEmpty)
                  const Icon(Icons.check_circle)
                else
                  const Icon(Icons.check_circle_outline),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (name.isEmpty ||
                  image.isEmpty ||
                  desc.isEmpty ||
                  imagePath.isEmpty) {
                AppStyles.toastMessage('Fill all the Input');
              } else {
                Navigator.of(context).pop([name, image, desc]);
              }
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
