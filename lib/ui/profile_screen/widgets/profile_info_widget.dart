import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String information;
  final String data;

  const ProfileInfoWidget({
    required this.information,
    Key? key,
    this.data = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          information,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data,
        ),
      ],
    );
  }
}
