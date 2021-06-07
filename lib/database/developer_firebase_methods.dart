import 'dart:html' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:portfolio_admin/models/developer.dart';

class DeveloperFirebaseMethods {
  static const String _collection = 'developers';
  addDeveloper({required String name, required html.File file}) async {
    String uid = DateTime.now().microsecondsSinceEpoch.toString();
    String? url;
    final path = '$_collection/$uid';
    await fb
        .storage()
        .refFromURL('gs://my-portfolio-96f42.appspot.com/')
        .child(path)
        .put(file)
        .future
        .then((_) async {
      await FirebaseStorage.instance
          .ref()
          .child(path)
          .getDownloadURL()
          .then((value) async {
        Developer developer = Developer(uid: uid, name: name, imageURL: value);
        await FirebaseFirestore.instance
            .collection(_collection)
            .doc(uid)
            .set(developer.toMap());
      });
    });
  }

  // await FirebaseFirestore.instance
  //     .collection(_collection)
  //     .doc(uid)
  //     .set(info)
  //     .catchError((e) {
  //   print(e.toString());
  // });
}
