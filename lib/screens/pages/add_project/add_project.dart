import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio_admin/database/recent_project_methods.dart';
import 'package:portfolio_admin/models/recent_projects.dart';
import 'package:portfolio_admin/screens/pages/add_project/upload_project_images.dart';
import 'package:portfolio_admin/screens/pages/add_project/upload_thumbnail.dart';
import 'package:portfolio_admin/screens/widgets/customiz_text_form_field.dart';

class AddProject extends StatefulWidget {
  static const routeName = '/AddProject';
  const AddProject({Key? key}) : super(key: key);
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<String> imagesURL = [];
  String thumbnailURL = '';

  _uploadThumbnail(String url) {
    thumbnailURL = url;
  }

  _uploadImages(List<String> list) {
    imagesURL = list;
    print('\nin foc');
    print(imagesURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Proejct'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomizeTextFormField(hint: 'Project Title', controller: _title),
              const SizedBox(height: 10),
              UploadThumbnail(uploadThumbnail: _uploadThumbnail),
              const SizedBox(height: 30),
              SizedBox(
                width: (MediaQuery.of(context).size.width > 500)
                    ? 400
                    : double.infinity,
                child: TextFormField(
                  controller: _description,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Project description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              UploadProjectImages(function: _uploadImages),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (imagesURL.length >= 0 &&
                      thumbnailURL.isNotEmpty &&
                      _title.text.isNotEmpty &&
                      _description.text.isNotEmpty) {
                    RecentProjects projects = RecentProjects(
                      title: _title.text.trim(),
                      description: _description.text.trim(),
                      developers: [],
                      projectType: [],
                      thumnailURL: thumbnailURL,
                      projectURL: [],
                      photosURL: imagesURL,
                    );
                    await RecentProjectMethods()
                        .addRecentProject(info: projects.toMap());
                  } else {
                    print('object');
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
