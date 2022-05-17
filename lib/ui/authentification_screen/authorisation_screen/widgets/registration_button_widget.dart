import 'package:flutter/material.dart';

class RegistrationButtonWidget extends StatefulWidget {
  const RegistrationButtonWidget({Key? key, required this.onClickedSignUp})
      : super(key: key);
  final VoidCallback onClickedSignUp;

  @override
  State<RegistrationButtonWidget> createState() =>
      _RegistrationButtonWidgetState();
}

class _RegistrationButtonWidgetState extends State<RegistrationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {});
        widget.onClickedSignUp();
      },
      child: const Center(
        child: Text(
          'Registration',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}
