import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: Image.asset('assets/main.jpg').image,
                radius: 34,
              ),
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
