import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:portfolio_admin/database/recent_project_methods.dart';

class UploadProjectImages extends StatefulWidget {
  final Function function;
  const UploadProjectImages({Key? key, required this.function})
      : super(key: key);

  @override
  _UploadProjectImagesState createState() => _UploadProjectImagesState();
}

class _UploadProjectImagesState extends State<UploadProjectImages> {
  List<html.File> imagesList = [];
  List<String> imagesURL = [];
  bool _needToUpload = false;

  @override
  Widget build(BuildContext context) {
    void _uploadImages() async {
      imagesList.forEach((file) async {
        final String tempURL = await RecentProjectMethods()
            .addRecentProjectToFirestore(name: file.name, file: file);
        imagesURL.add(tempURL);
      });
    }

    void startWebFilePicker() async {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.multiple = true;
      uploadInput.draggable = true;
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final files = uploadInput.files;
        for (var i = 0; i < files!.length; i++) {
          final file = files[i];
          final reader = new html.FileReader();
          reader.onLoadEnd.listen((event) {
            imagesList.add(file);
          });
          reader.onError.listen((event) {
            print('there was an error');
          });
          reader.readAsArrayBuffer(file);
        }
        setState(() {
          _needToUpload = true;
        });
      });
    }

    return Container(
      width: 400,
      height: 200,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.3),
      ),
      child: Column(
        children: [
          Flexible(
            child: (imagesList.length > 0)
                ? ListView.builder(
                    itemCount: imagesList.length,
                    itemBuilder: (context, index) =>
                        Text(imagesList[index].name),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Images not selected yet'),
                      Text('Select a image please'),
                    ],
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  startWebFilePicker();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'Choose photos',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              if (_needToUpload)
                GestureDetector(
                  onTap: () async {
                    _uploadImages();
                    widget.function(imagesURL);
                    setState(() {
                      _needToUpload = false;
                    });
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
            ],
          )
        ],
      ),
    );
  }
}
