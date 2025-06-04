import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/services/user.service.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionPayments extends StatefulWidget {
  const SubscriptionPayments({super.key});

  @override
  State<SubscriptionPayments> createState() => _SubscriptionPaymentsState();
}

class _SubscriptionPaymentsState extends State<SubscriptionPayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.account.subscription_payments.title,
          style: getTextTheme(context).bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
        final currentSubscription = UserService.getCurrentSubscription(
          authState.user,
        );

        return Column(
          children: [
            Text(context.t.paywall
                .pricing[currentSubscription.purchaseData["product_id"]].title, style: getTextTheme(context).bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ],
        );
      }),
    );
  }
}
