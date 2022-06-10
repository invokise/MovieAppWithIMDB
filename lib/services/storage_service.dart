import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadImage(String path, String email, String ext) async {
    File file = File(path);
    await storage.ref('profile_images/$email/profile_image.$ext').putFile(file);
  }

  Future<String?> downloadImage(String email, String ext) async {
    try {
      final image = await storage
          .ref('profile_images/$email/profile_image.$ext')
          .getDownloadURL();
      return image;
    } catch (e) {
      return null;
    }
  }
}
