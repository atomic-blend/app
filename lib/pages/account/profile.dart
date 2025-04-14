import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/account/profile_edit.dart';
import 'package:app/pages/account/profile_info.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/name_generator.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  bool? _editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme(context).surface,
      appBar: AppBar(
        backgroundColor: getTheme(context).surface,
        title: Text(
          context.t.account.profile.my_profile,
          style: getTextTheme(context).headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          if (_editMode != true)
            Padding(
              padding: EdgeInsets.only(right: $constants.insets.sm),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _editMode = true;
                    });
                  },
                  icon: const Icon(
                    CupertinoIcons.pencil,
                    size: 30,
                  )),
            ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: getSize(context).height * 0.1,
                    width: getSize(context).width * 0.2,
                    child: RandomAvatar(authState.user?.email ?? ""),
                  ),
                  Text(
                    authState.user?.firstname ??
                        NameGenerator.generate(context),
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: $constants.insets.md,
              ),
              Divider(
                color: Colors.grey.withValues(alpha: 0.5),
                height: 1,
                thickness: 1,
              ),
              SizedBox(
                height: $constants.insets.md,
              ),
              if (_editMode != true) const UserProfileInfos(),
              if (_editMode == true) const Expanded(child: UserProfileEdit()),
            ],
          ),
        );
      }),
    );
  }
}
