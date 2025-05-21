import 'dart:async';

import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.focusNode,
      this.value,
      this.disabled,
      this.onDelete,
      this.onChange,
      this.trailing,
      this.onSubmitted,
      this.autocorrect,
      this.obscureText,
      this.borderRadius,
      this.autofillHints,
      this.textColor,
      this.keyboardType,
      this.validator,
      this.autofocus,
      this.backgroundColor,
      this.height,
      this.textStyle,
      this.labelDescription});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? labelDescription;
  final String? value;
  final bool? disabled;
  final VoidCallback? onDelete;
  final Widget? trailing;
  final VoidCallback? onSubmitted;
  final VoidCallback? onChange;
  final bool? autocorrect;
  final bool? obscureText;
  final double? borderRadius;
  final Color? textColor;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Color? backgroundColor;
  final double? height;
  final TextStyle? textStyle;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  Timer? _checkTypingTimer;
  bool? _obscureText;

  startTimer() {
    _checkTypingTimer = Timer(const Duration(milliseconds: 600), () {
      if (widget.onChange != null) widget.onChange!();
    });
  }

  resetTimer() {
    _checkTypingTimer?.cancel();
    startTimer();
  }

  @override
  void initState() {
    if (widget.obscureText != null) _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText!,
              style: getTextTheme(context).bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          if (widget.labelDescription != null)
            Text(
              widget.labelDescription!,
              style: getTextTheme(context).bodySmall!.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          SizedBox(
            height: $constants.insets.xxs,
          ),
          Stack(
            children: [
              SizedBox(
                height: widget.height,
                child: TextFormField(
                  validator: widget.validator,
                  autofocus: widget.autofocus ?? false,
                  autofillHints: widget.autofillHints,
                  controller: widget.controller,
                  autocorrect: widget.autocorrect ?? true,
                  obscureText: _obscureText ?? false,
                  onChanged: (value) {
                    resetTimer();
                  },
                  onEditingComplete: () {
                    if (widget.onSubmitted != null) widget.onSubmitted!();
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  },
                  enabled: widget.disabled != null ? !widget.disabled! : true,
                  focusNode: widget.focusNode,
                  initialValue: widget.value,
                  keyboardType: widget.keyboardType,
                  style: widget.textStyle ??
                      getTextTheme(context).bodyMedium!.copyWith(
                          color:
                              widget.textColor ?? getTheme(context).onSurface),
                  decoration: InputDecoration(
                    fillColor: widget.backgroundColor ??
                        getTheme(context).surfaceContainer,
                    hintText: widget.hintText,
                    hintStyle: getTextTheme(context).bodyMedium!.copyWith(
                          color: Colors.grey[700],
                        ),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular($constants.insets.sm),
                    ),
                  ),
                ),
              ),
              if (widget.onDelete != null)
                Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                        onPressed: widget.onDelete,
                        icon: const Icon(LineAwesome.times_circle))),
              if (widget.obscureText != null)
                Positioned(
                    right: $constants.insets.sm,
                    top: $constants.insets.xs,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText!;
                          });
                        },
                        child: Icon(_obscureText != true
                            ? LineAwesome.eye_slash
                            : LineAwesome.eye))),
              if (widget.trailing != null)
                Positioned(
                    right: 0, top: 0, bottom: 0, child: widget.trailing!),
            ],
          ),
        ],
      );
    });
  }
}
