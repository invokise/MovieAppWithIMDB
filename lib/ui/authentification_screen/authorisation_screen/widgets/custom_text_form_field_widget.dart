import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.validator,
    required this.obscureText,
  }) : super(key: key);

  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?) validator;
  final bool obscureText;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: widget.hintText,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      obscureText: widget.obscureText,
    );
  }
}
