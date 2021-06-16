import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase/firebase.dart' as fb;

class RecentProjectMethods {
  static const String _collection = 'recent_projects';
  Future<String> addRecentProjectToFirestore(
      {required String name, required html.File file}) async {
    String uid = DateTime.now().microsecondsSinceEpoch.toString();
    final path = '$_collection/$uid';
    return await fb
        .storage()
        .refFromURL('gs://my-portfolio-96f42.appspot.com/')
        .child(path)
        .put(file)
        .future
        .then((_) async =>
            await FirebaseStorage.instance.ref().child(path).getDownloadURL());
  }

  addRecentProject({required Map<String, dynamic> info}) async {
    await FirebaseFirestore.instance.collection(_collection).add(info);
  }
}
