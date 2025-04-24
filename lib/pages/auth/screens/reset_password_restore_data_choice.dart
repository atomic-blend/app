import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/forms/app_text_form_field.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordRestoreDataChoice extends StatefulWidget {
  final Function(bool, String?) restoreDataChoiceCallback;
  const ResetPasswordRestoreDataChoice(
      {super.key, required this.restoreDataChoiceCallback});

  @override
  State<ResetPasswordRestoreDataChoice> createState() =>
      _ResetPasswordRestoreDataChoiceState();
}

class _ResetPasswordRestoreDataChoiceState
    extends State<ResetPasswordRestoreDataChoice>
    with TickerProviderStateMixin {
      final _formKey = GlobalKey<FormState>();
      final TextEditingController _mnemonicKeyController =
      TextEditingController();
  late AnimationController _animationController;
  late AnimationController _lottieController;
  final _animationDuration = const Duration(milliseconds: 250);
  bool? _restoreData;
  bool? _confirmReset = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
    );
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      lowerBound: 0.2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getSize(context).height * 0.86,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: getSize(context).height * 0.1,
          ),
          Animate(
            controller: _animationController,
            effects: [
              FadeEffect(
                duration: _animationDuration,
                delay: const Duration(milliseconds: 0),
              ),
            ],
            onPlay: (controller) => controller.forward(),
            child: Lottie.asset(
              controller: _lottieController,
              onLoaded: (p0) => _lottieController.loop(),
              'assets/animations/computer_lock.json',
              width: getSize(context).width * 0.5,
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  context.t.auth.reset_password.do_you_have_your_mnemonic_key,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: $constants.insets.xs,
                ),
                Text(
                  context.t.auth.reset_password.backup_key_description,
                  style: getTextTheme(context).bodyMedium!.copyWith(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: $constants.insets.sm,
          ),
          Column(
            children: [
              PrimaryButtonSquare(
                text: context.t.auth.reset_password.yes_i_have,
                outlined: _restoreData == true ? false : true,
                backgroundColor: getTheme(context).primary,
                onPressed: () {
                  setState(() {
                    _restoreData = true;
                  });
                  // widget.restoreDataChoiceCallback(_restoreData!, null);
                },
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              PrimaryButtonSquare(
                text: context.t.auth.reset_password.no_i_dont,
                outlined: _restoreData == false ? false : true,
                backgroundColor: getTheme(context).error,
                onPressed: () async {
                  setState(() {
                    _restoreData = false;
                  });
                },
              ),
              if (_restoreData == false)
                Padding(
                  padding: EdgeInsets.only(top: $constants.insets.sm),
                  child: Row(
                    children: [
                      CupertinoCheckbox(
                          value: _confirmReset ?? false,
                          onChanged: (value) {
                            setState(() {
                              _confirmReset = value;
                            });
                          }),
                      SizedBox(
                        width: $constants.insets.xs,
                      ),
                      SizedBox(
                        width: getSize(context).width * 0.75,
                        child: Flexible(
                          child: Text(
                            context.t.auth.reset_password.reset_data_warning,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (_restoreData == true) 
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(top: $constants.insets.sm),
                    child: AppTextFormField(
                      controller: _mnemonicKeyController,
                      labelText: context.t.auth.reset_password.mnemonic_key,
                      labelDescription: context
                          .t.auth.reset_password.mnemonic_key_description,
                      hintText: context.t.auth.reset_password.mnemonic_key_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context
                              .t.auth.reset_password.mnemonic_key_required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
            ],
          ),
          const Spacer(),
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
              padding: EdgeInsets.symmetric(horizontal: $constants.insets.md),
              height: getSize(context).height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  PrimaryButtonSquare(
                    text: context.t.actions.next,
                    backgroundColor: getTheme(context).primary,
                    onPressed: () async {
                      if (_restoreData == null) {
                        return;
                      }

                      if (_restoreData == true) {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _animationController.reverseDuration =
                            const Duration(milliseconds: 500);
                        _animationController.reverse();
                        widget.restoreDataChoiceCallback(_restoreData!, _mnemonicKeyController.text);
                      } else {
                        if (_confirmReset != true) {
                          return;
                        }
                        _animationController.reverseDuration =
                            const Duration(milliseconds: 500);
                        _animationController.reverse();
                        widget.restoreDataChoiceCallback(
                          _restoreData!,
                          null,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
