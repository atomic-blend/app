import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';
import '../../utils/shortcuts.dart';

class DeleteAccountModal extends StatefulWidget {
  const DeleteAccountModal({super.key});

  @override
  State<DeleteAccountModal> createState() => _DeleteAccountModalState();
}

class _DeleteAccountModalState extends State<DeleteAccountModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is UserDeleted) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            context.read<AuthBloc>().add(const Logout());
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: $constants.insets.md,
            vertical: $constants.insets.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.auth.delete_account.title,
                style: getTextTheme(context)
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              Text(
                context.t.auth.delete_account.description,
                style: getTextTheme(context).bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: $constants.insets.xs,
              ),
              Text(
                context.t.auth.delete_account.cannot_be_undone,
                style: getTextTheme(context).bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              SizedBox(
                height: $constants.insets.md,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButtonSquare(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: context.t.actions.cancel,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: $constants.insets.md,
                  ),
                  Expanded(
                    child: PrimaryButtonSquare(
                      onPressed: () async {
                        if (!context.mounted) return;
                        context.read<AuthBloc>().add(const DeleteUser());
                      },
                      text: context.t.actions.delete,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
