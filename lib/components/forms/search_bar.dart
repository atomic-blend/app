import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ABSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String? placeholder;

  const ABSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.placeholder,
  });

  @override
  State<ABSearchBar> createState() => _ABSearchBarState();
}

class _ABSearchBarState extends State<ABSearchBar> {
  @override
  Widget build(BuildContext context) {
    // Use Cupertino search bar for iOS, and Material for other platforms
    if (!kIsWeb && (Platform.isIOS || Platform.isMacOS)) {
      return CupertinoSearchTextField(
        controller: widget.controller,
        placeholder: widget.placeholder ?? 'Search',
        onSubmitted: widget.onSubmitted,
      );
    } else {
      return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.placeholder ?? 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        onSubmitted: widget.onSubmitted,
      );
    }
  }
}
