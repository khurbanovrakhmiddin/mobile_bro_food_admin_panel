
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StoreRepos {
  static final _storage = FirebaseStorage.instance.ref();
  static const folder = "images";

  static Future<String> uploadImage(Uint8List image) async {
    Reference ref = _storage.child(folder).child('${DateTime.now()}'
        '.jpeg');
    UploadTask uploadTask = ref.putData(image, SettableMetadata
      (contentType: 'image/jpeg'));
    TaskSnapshot taskSnapshot = await uploadTask
        .whenComplete(() => print('done'))
        .catchError((error) => print('something went wrong$error'),);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    print('Succes');
    print(downloadUrl);
    return downloadUrl;
  }
}