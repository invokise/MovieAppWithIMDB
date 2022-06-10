import 'package:file_picker/file_picker.dart';
import 'package:filmoteka/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatefulWidget {
  const ProfileAvatarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User? user;
  @override
  State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  final storage = Storage();
  String? userPhoto;

  @override
  void initState() {
    userPhoto = widget.user!.photoURL;
    super.initState();
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Image file not selected'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final results = await FilePicker.platform.pickFiles(
                  allowedExtensions: ['jpg', 'png'],
                  type: FileType.custom,
                  allowMultiple: false,
                );
                if (results == null) {
                  showSnackbar();
                  return;
                }

                final imagePath = results.files.single.path!;
                final userEmail = widget.user!.email!;

                final imageName = results.files.single.name;
                final extension = imageName.split('.').last;

                await storage.uploadImage(imagePath, userEmail, extension);
                final newUserPhoto =
                    await storage.downloadImage(userEmail, extension);
                await widget.user!.updatePhotoURL(newUserPhoto);
                userPhoto = newUserPhoto;
                setState(() {});
              },
              child: CircleAvatar(
                  backgroundImage: userPhoto == null || userPhoto!.isEmpty
                      ? Image.asset('assets/plug.jpg').image
                      : NetworkImage(userPhoto!),
                  radius: 34),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Avatar',
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Click on the picture to change it',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
