import 'package:flutter/material.dart';

class SignUpButtonWidget extends StatefulWidget {
  const SignUpButtonWidget({Key? key, required this.signUp}) : super(key: key);
  final Function signUp;

  @override
  State<SignUpButtonWidget> createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromRGBO(3, 37, 65, 1),
        ),
      ),
      onPressed: () async {
        setState(() {});
        await widget.signUp();
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 350,
        child: const Center(
          child: Text(
            'Sign up',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
