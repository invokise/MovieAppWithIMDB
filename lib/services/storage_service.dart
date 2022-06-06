import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImage(String path, String imageName) async {
    File file = File(path);
    await storage
        .ref('profile_images/$imageName')
        .putFile(file);
  }

  Future<String> downloadImage(String imageName) async {
    final image =
        await storage.ref('profile_images/$imageName').getDownloadURL();
    return image;
  }

  Future<void> deleteImage(String imageName) async {
    await storage.ref('profile_images/$imageName').delete();
  }
}
