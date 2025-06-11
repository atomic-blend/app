import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class ABSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final String? placeholder;

  const ABSearchBar({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onChanged,
    this.onClear,
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
        backgroundColor: getTheme(context).surfaceContainer,
        controller: widget.controller,
        placeholder: widget.placeholder ?? 'Search',
        onSubmitted: widget.onSubmitted,
        onChanged: (value) {
          if (value.isEmpty && widget.onClear != null) {
            widget.onClear!();
            return;
          }
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
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
          fillColor: getTheme(context).surfaceContainer,
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
