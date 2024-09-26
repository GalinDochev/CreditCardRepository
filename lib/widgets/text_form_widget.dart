import 'package:debit_card_scanner/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.onChanged,
    this.validator,
    this.controller,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.setHeight(9),
      width: context.setWidth(90),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: context.setHorizontalPadding(context, 3),
              vertical: context.setVerticalPadding(context, 1.5)),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
        ),
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
