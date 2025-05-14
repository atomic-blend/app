import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:app/utils/toast_helper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class MnemonicKey extends StatefulWidget {
  const MnemonicKey(
      {super.key,
      this.cancelCallback,
      required this.onSuccess,
      required this.mnemonic,
      this.widgetMode});
  final bool? widgetMode;
  final String mnemonic;
  final VoidCallback? cancelCallback;
  final VoidCallback onSuccess;

  @override
  State<MnemonicKey> createState() => _MnemonicKeyState();
}

class _MnemonicKeyState extends State<MnemonicKey>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _animationDuration = const Duration(milliseconds: 250);
  final TextEditingController _mnemonicController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isConfirmStep = false;
  String? _mnemonic;

  @override
  initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    _mnemonic = widget.mnemonic;
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {},
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: widget.widgetMode != true
                ? getSize(context).height * 0.92
                : getSize(context).height * 0.875,
            child: Column(
              children: [
                SizedBox(
                  height: getSize(context).height * 0.08,
                ),
                Animate(
                  controller: _animationController,
                  effects: [
                    FadeEffect(
                      duration: _animationDuration,
                      delay: const Duration(milliseconds: 0),
                    )
                  ],
                  onPlay: (controller) => controller.forward(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widget.widgetMode != true
                            ? $constants.insets.md
                            : 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: Lottie.asset(
                              'assets/animations/computer_lock.json',
                              fit: BoxFit.cover,
                              width: isDesktop(context)
                                  ? getSize(context).width * 0.2
                                  : getSize(context).width * 0.5,
                            ),
                          ),
                          AutoSizeText(
                            maxLines: 1,
                            context.t.auth.mnemonic_key.title,
                            style: getTextTheme(context).displaySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(
                            height: $constants.insets.xs,
                          ),
                          SizedBox(
                            width: getSize(context).width * 0.9,
                            child: Text.rich(
                              TextSpan(
                                text:
                                    "${context.t.auth.mnemonic_key.description_start}\n",
                                children: [
                                  TextSpan(
                                    text:
                                        '${context.t.auth.mnemonic_key.description_mid}\n\n',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                      text: context
                                          .t.auth.mnemonic_key.description_end),
                                ],
                              ),
                            ),
                          ),
                          if (_isConfirmStep == false) ...[
                            SizedBox(
                              height: $constants.insets.md,
                            ),
                            GestureDetector(
                              onTap: () {
                                //copy to clipboard
                                Clipboard.setData(
                                  ClipboardData(text: _mnemonic ?? ""),
                                );
                                ToastHelper.showSuccess(
                                    context: context,
                                    title: context
                                        .t.auth.mnemonic_key.copy_success,
                                    description: "");
                              },
                              child: Container(
                                padding: EdgeInsets.all($constants.insets.sm),
                                decoration: BoxDecoration(
                                  color: getTheme(context).surfaceContainer,
                                  borderRadius: BorderRadius.circular(
                                      $constants.corners.md),
                                ),
                                child: Text(
                                  _mnemonic ?? "",
                                  style: getTextTheme(context)
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                          if (_isConfirmStep == true) ...[
                            SizedBox(
                              height: $constants.insets.xs,
                            ),
                            SizedBox(
                              width: getSize(context).width * 0.9,
                              child: AppTextFormField(
                                controller: _mnemonicController,
                                hintText:
                                    context.t.auth.mnemonic_key.mnemonic_hint,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .t.auth.mnemonic_key.mnemonic_error;
                                  }
                                  if (value != _mnemonic) {
                                    return context
                                        .t.auth.mnemonic_key.mnemonic_error;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getSize(context).height * 0.23,
                ),
                const Divider(),
                Animate(
                  controller: _animationController,
                  effects: [
                    FadeEffect(
                      duration: _animationDuration,
                      delay: const Duration(milliseconds: 500),
                    )
                  ],
                  onPlay: (controller) => controller.forward(),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: $constants.insets.md),
                    height: getSize(context).height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        PrimaryButtonSquare(
                          text: context.t.actions.next,
                          backgroundColor: getTheme(context).primary,
                          onPressed: () async {
                            if (_isConfirmStep == false) {
                              setState(() {
                                _isConfirmStep = true;
                              });
                              return;
                            }
                            if (_mnemonicController.text.isEmpty) {
                              return;
                            }
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _animationController.reverseDuration =
                                const Duration(
                              milliseconds: 500,
                            );
                            await _animationController.reverse(from: 1.0);

                            if (!context.mounted) return;
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: $constants.insets.lg,
                ),
              ],
            ),
          ),
          if (widget.widgetMode != true)
            Positioned(
              left: $constants.insets.sm,
              top: $constants.insets.md,
              child: GestureDetector(
                onTap: widget.cancelCallback,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      OctIcons.arrow_left,
                      size: 18,
                    ),
                    SizedBox(
                      width: $constants.insets.xxs,
                    ),
                    Text(
                      context.t.actions.back,
                      style: getTextTheme(context)
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
