import 'package:flutter/material.dart';

class SignInButtonWidget extends StatefulWidget {
  const SignInButtonWidget({
    Key? key,
    required this.signIn,
  }) : super(key: key);
  final Function signIn;

  @override
  State<SignInButtonWidget> createState() => _SignInButtonWidgetState();
}

class _SignInButtonWidgetState extends State<SignInButtonWidget> {
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
        await widget.signIn();
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 350,
        child: const Center(
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
