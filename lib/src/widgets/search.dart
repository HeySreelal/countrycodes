import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Search',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white70,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
