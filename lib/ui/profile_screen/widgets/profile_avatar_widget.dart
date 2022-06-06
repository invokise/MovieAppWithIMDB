import 'package:filmoteka/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final picker = ImagePicker();

  String? userPhoto;

  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    userPhoto = user!.photoURL;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image == null) return;
                storage.deleteImage(user.photoURL!
                    .substring(91, user.photoURL!.lastIndexOf('?')));
                storage.deleteImage(user.photoURL!);

                final imagePath = image.path;
                final imageName = image.name;
                await storage.uploadImage(imagePath, imageName);
                final newUserPhoto = await storage.downloadImage(imageName);
                await user.updatePhotoURL(newUserPhoto);
                userPhoto = user.photoURL;
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




// import 'package:filmoteka/services/storage_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileAvatarWidget extends StatefulWidget {
//   const ProfileAvatarWidget({
//     Key? key,
//     required this.user,
//   }) : super(key: key);
//   final User? user;
//   @override
//   State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
// }

// class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
//   final storage = Storage();
//   final picker = ImagePicker();
//   String? userPhoto;

//   @override
//   void initState() {
//     userPhoto = widget.user!.photoURL;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = widget.user;
//     userPhoto = user!.photoURL;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             InkWell(
//               onTap: () async {
//                 final image =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 if (image == null) return;

//                 storage.deleteImage(user.photoURL!);

//                 final imagePath = image.path;
//                 final imageName = image.name;
//                 await storage.uploadImage(imagePath, imageName);
//                 userPhoto = user.photoURL;
//                 await user.updatePhotoURL(userPhoto);
//                 await storage.downloadImage(imageName);
//                 setState(() {
//                   userPhoto = user.photoURL;
//                 });
//               },
//               child: FutureBuilder(
//                 future: storage.downloadImage(userPhoto!),
//                 builder: (context, snapshot) {
//                   return CircleAvatar(
//                       backgroundImage: snapshot.data == null ||
//                               snapshot.data.toString().isEmpty
//                           ? Image.asset('assets/plug.jpg').image
//                           : NetworkImage(snapshot.data.toString()),
//                       radius: 34);
//                 },
//               ),
//             ),
//             const SizedBox(
//               width: 15,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   'Avatar',
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   'Click on the picture to change it',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

