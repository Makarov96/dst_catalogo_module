import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseInput extends StatelessWidget {
  BaseInput({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.onChanged,
    this.onPressed,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  void Function(String)? onChanged;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        hintText: hintText,
        fillColor: Colors.white70,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
