import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/components/buttons/icon_text_button.dart';
import 'package:app/components/buttons/primary_button_round.dart';
import 'package:app/components/modals/delete_account_modal.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/account/profile.dart';
import 'package:app/pages/account/security.dart';
import 'package:app/pages/account/subscription_payments.dart';
import 'package:app/pages/paywall/paywall_utils.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/api_client.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/name_generator.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_avatar/random_avatar.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const RefreshUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authstate) {
      return SizedBox(
        width: double.infinity,
        height: getSize(context).height * 0.87,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: $constants.insets.md,
                        horizontal: $constants.insets.sm),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(CupertinoIcons.arrow_left)),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              context.read<AuthBloc>().add(const Logout());
                              Navigator.of(context).pop();
                            },
                            child: Text(context.t.settings.logout))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.1,
                    width: getSize(context).width * 0.2,
                    child: RandomAvatar(authstate.user?.email ?? ""),
                  ),
                  Text(
                    authstate.user?.firstname ??
                        NameGenerator.generate(context),
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(authstate.user?.email ?? ""),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  PrimaryButtonRound(
                    height: 35,
                    trailing: Icon(
                      CupertinoIcons.chevron_right,
                      size: 12,
                      color: getTheme(context).surface,
                    ),
                    text: context.t.account.edit_profile,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UserProfile(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: $constants.insets.lg,
                  ),
                ],
              ),
              Text(
                context.t.account.sections.account,
                style: getTextTheme(context)
                    .labelMedium!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: $constants.insets.xs,
              ),
              if (ApiClient.getSelfHostedRestApiUrl() == null) ...[
                IconTextButton(
                  icon: CupertinoIcons.star_fill,
                  iconContainer: true,
                  iconSize: 20,
                  iconColor: Colors.grey[700],
                  text: context.t.account.subscription_payments.title,
                  onTap: () {
                    if (UserService.isSubscriptionActive(authstate.user)) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SubscriptionPayments(),
                        ),
                      );
                    } else {
                      PaywallUtils.showPaywall(context);
                    }
                  },
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
              ],
              IconTextButton(
                icon: CupertinoIcons.lock,
                iconContainer: true,
                iconSize: 20,
                iconColor: Colors.grey[700],
                text: context.t.account.actions.security,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Security(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: $constants.insets.sm,
              ),
              IconTextButton(
                icon: CupertinoIcons.delete,
                iconContainer: true,
                iconSize: 20,
                iconColor: Colors.red,
                textColor: Colors.red,
                text: context.t.account.actions.delete_account,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DeleteAccountModal();
                    },
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
