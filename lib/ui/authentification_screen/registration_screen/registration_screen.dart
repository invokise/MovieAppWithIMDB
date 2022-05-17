import 'package:email_validator/email_validator.dart';
import 'package:filmoteka/ui/authentification_screen/registration_screen/widgets/custom_text_form_field_widget.dart';
import 'package:filmoteka/ui/authentification_screen/registration_screen/widgets/sign_up_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key, required this.onClickedSignIn})
      : super(key: key);
  final VoidCallback onClickedSignIn;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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

  String? validateRepeatPassword(String? repeatedPassword) {
    if (repeatedPassword != _passwordController.text.trim()) {
      return "Passwords don't match";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        title: const Text(
          'Registration',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {});
            widget.onClickedSignIn();
          },
        ),
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
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  hintText: 'Repeat password',
                  textEditingController: _repeatPasswordController,
                  validator: validateRepeatPassword,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                SignUpButtonWidget(signUp: signUp),
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
    _repeatPasswordController.dispose();
    super.dispose();
  }
}
