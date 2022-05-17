import 'package:email_validator/email_validator.dart';
import 'package:filmoteka/ui/authentification_screen/authorisation_screen/widgets/custom_text_form_field_widget.dart';
import 'package:filmoteka/ui/authentification_screen/authorisation_screen/widgets/registration_button_widget.dart';
import 'package:filmoteka/ui/authentification_screen/authorisation_screen/widgets/sign_in_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthorisationScreen extends StatefulWidget {
  const AuthorisationScreen({Key? key, required this.onClickedSignUp})
      : super(key: key);
  final VoidCallback onClickedSignUp;

  @override
  State<AuthorisationScreen> createState() => _AuthorisationScreenState();
}

class _AuthorisationScreenState extends State<AuthorisationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  String? validateEmail(String? email) {
    if (!EmailValidator.validate(email!)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password!.length < 6) {
      return "The password cannot be less than 6 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        title: const Text('Authorisation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormFieldWidget(
                  hintText: 'Email',
                  textEditingController: _emailController,
                  validator: validateEmail,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Password',
                  textEditingController: _passwordController,
                  validator: validatePassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                SignInButtonWidget(
                  signIn: signIn,
                ),
                const SizedBox(
                  height: 10,
                ),
                RegistrationButtonWidget(
                    onClickedSignUp: widget.onClickedSignUp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
