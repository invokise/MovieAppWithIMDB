import 'package:filmoteka/constants/text_styles.dart';
import 'package:flutter/material.dart';

class TitleOfContentWidget extends StatefulWidget {
  final String nameTypeOfFilms;
  const TitleOfContentWidget({
    Key? key,
    required this.nameTypeOfFilms,
  }) : super(key: key);

  @override
  State<TitleOfContentWidget> createState() => _TitleOfContentWidgetState();
}

class _TitleOfContentWidgetState extends State<TitleOfContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            widget.nameTypeOfFilms,
            style: AppTextStyles.blackText15,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'More',
            style: AppTextStyles.greenText15,
          ),
        ),
      ],
    );
  }
}
