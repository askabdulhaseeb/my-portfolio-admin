import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:portfolio_admin/database/developer_firebase_methods.dart';
import 'package:portfolio_admin/screens/widgets/show_loading_dislog.dart';
import 'package:uuid/uuid.dart';

import 'package:portfolio_admin/models/developer.dart';
import 'package:portfolio_admin/screens/widgets/customiz_text_form_field.dart';

class AddDeveloper extends StatefulWidget {
  static const routeName = '/AddDeveloper';
  const AddDeveloper({Key? key}) : super(key: key);
  @override
  _AddDeveloperState createState() => _AddDeveloperState();
}

class _AddDeveloperState extends State<AddDeveloper> {
  final TextEditingController _name = TextEditingController();
  File? pickedImage;
  String _imageInfo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Developer'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomizeTextFormField(hint: 'Name', controller: _name),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _selectImage();
            },
            child: Container(
              height: 100,
              width: 100,
              child: (pickedImage == null) ? Icon(Icons.image) : Container(),
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              showLoadingDialog(context);
              String uid = DateTime.now().microsecondsSinceEpoch.toString();
              Developer developer = Developer(
                uid: uid,
                name: _name.text.trim(),
                imageURL: '',
              );
              await DeveloperFirebaseMethods().addDeveloper(
                uid: uid,
                info: developer.toMap(),
              );
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  _selectImage() async {
    File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    setState(() {
      pickedImage = infos;
      _imageInfo = 'Name: ${infos.name}\nRelative Path: ${infos.relativePath}';
      // DeveloperFirebaseMethods().storeImageToFirestore(infos);
    });

    // Image? fromPicker =
    //     await ImagePickerWeb.getImage(outputType: ImageType.widget);

    // if (fromPicker != null) {
    //   setState(() {
    //     pickedImage = fromPicker;
    //   });
    // }
  }
}
