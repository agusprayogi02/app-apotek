import 'package:flutter/material.dart';

class InputOutline extends StatelessWidget {
  const InputOutline({
    Key? key,
    required this.controller,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        labelText: "$hint",
        enabled: false,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
