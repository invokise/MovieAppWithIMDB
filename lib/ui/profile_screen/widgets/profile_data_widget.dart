import 'package:filmoteka/ui/profile_screen/widgets/profile_avatar_widget.dart';
import 'package:filmoteka/ui/profile_screen/widgets/profile_info_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: ProfileAvatarWidget(
            user: user,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileInfoWidget(
                information: 'Name',
                data: user!.email!
                    .substring(0, user.email!.indexOf('@'))
                    .toString(),
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileInfoWidget(
                information: 'E-mail',
                data: user.email.toString(),
              ),
              const SizedBox(
                height: 30,
              ),
              const ProfileInfoWidget(
                information: 'Password',
                data: '********',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.exit_to_app,
                  size: 27,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5),
                  child: Text(
                    'Exit',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
