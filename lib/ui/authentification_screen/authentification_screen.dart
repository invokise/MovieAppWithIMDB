import 'package:filmoteka/ui/authentification_screen/authorisation_screen/authorisation_screen.dart';
import 'package:filmoteka/ui/authentification_screen/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  bool isLogin = true;

  void toggle() => setState(() => isLogin = !isLogin);
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? AuthorisationScreen(
            onClickedSignUp: toggle,
          )
        : RegistrationScreen(
            onClickedSignIn: toggle,
          );
  }
}
