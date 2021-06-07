import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio_admin/screens/widgets/customiz_toast.dart';
import 'package:portfolio_admin/database/developer_firebase_methods.dart';
import 'package:portfolio_admin/screens/widgets/customiz_text_form_field.dart';
import 'package:portfolio_admin/screens/widgets/show_loading_dislog.dart';

class AddDeveloper extends StatefulWidget {
  static const routeName = '/AddDeveloper';
  const AddDeveloper({Key? key}) : super(key: key);
  @override
  _AddDeveloperState createState() => _AddDeveloperState();
}

class _AddDeveloperState extends State<AddDeveloper> {
  final TextEditingController _name = TextEditingController();
  html.File? pickedFile;
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
              child: Icon(Icons.image),
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              if (_name.text.trim().isNotEmpty && pickedFile != null) {
                showLoadingDialog(context);
                await DeveloperFirebaseMethods().addDeveloper(
                  name: _name.text.trim(),
                  file: pickedFile!,
                );
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              } else {
                errorToast(message: 'Write Name or Select Image');
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  _selectImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement()
      ..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final html.File file = uploadInput.files!.first;
      final reader = html.FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        setState(() {
          pickedFile = file;
        });
      });
    });
  }
}
