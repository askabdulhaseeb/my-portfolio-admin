import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:portfolio_admin/database/recent_project_methods.dart';

class UploadThumbnail extends StatefulWidget {
  final Function uploadThumbnail;
  const UploadThumbnail({Key? key, required this.uploadThumbnail})
      : super(key: key);

  @override
  _UploadThumbnailState createState() => _UploadThumbnailState();
}

class _UploadThumbnailState extends State<UploadThumbnail> {
  html.File? thumbnail;
  String thumbnailURL = '';
  bool isUploaded = false;
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
          thumbnail = file;
          isUploaded = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: (isUploaded) ? Colors.green : Colors.red,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _selectImage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (thumbnail != null)
                    ? Text('${thumbnail!.name}')
                    : Container(
                        child: Text(
                          'No Thumbnail selected yet!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Choose a thumnail',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (thumbnail != null && isUploaded == false)
              ? GestureDetector(
                  onTap: () async {
                    final String url = await RecentProjectMethods()
                        .addRecentProjectToFirestore(
                      name: thumbnail!.name,
                      file: thumbnail!,
                    );
                    setState(() {
                      isUploaded = true;
                    });
                    widget.uploadThumbnail(url);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                    child: Text(
                      'Upload Thumnail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(height: 0, width: 0),
        ],
      ),
    );
  }
}
