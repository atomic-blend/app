import 'package:app/components/buttons/primary_button_square.dart';
import 'package:app/components/widgets/elevated_container.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paywall extends StatefulWidget {
  const Paywall({super.key});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($constants.insets.md),
      child: Column(
        children: [
          SizedBox(
            height: getSize(context).height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedContainer(
                        width: 40,
                        height: 40,
                        borderRadius: $constants.corners.full,
                        child: const Icon(
                          CupertinoIcons.xmark,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getSize(context).height * 0.1,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular($constants.corners.xl),
                      child: Image.asset(
                        'assets/images/atomic_blend_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  Text(
                    context.t.paywall.title,
                    style: getTextTheme(context).headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    context.t.paywall.subtitle,
                    textAlign: TextAlign.center,
                    style: getTextTheme(context).bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  SizedBox(
                    height: $constants.insets.md,
                  ),
                  ElevatedContainer(
                    width: double.infinity,
                    borderRadius: $constants.corners.sm,
                    padding: EdgeInsets.symmetric(
                      horizontal: $constants.insets.md,
                      vertical: $constants.insets.md,
                    ),
                    child: Column(
                      spacing: $constants.insets.md,
                      children: [
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.all_apps_of_the_suite.title,
                          description: context.t.paywall.advantages
                              .all_apps_of_the_suite.description,
                          icon: CupertinoIcons.square_grid_2x2,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.end_to_end_encrypted.title,
                          description: context.t.paywall.advantages
                              .end_to_end_encrypted.description,
                          icon: CupertinoIcons.lock,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.unlimited_tasks.title,
                          description: context
                              .t.paywall.advantages.unlimited_tasks.description,
                          icon: CupertinoIcons.checkmark_square,
                        ),
                        _buildAdvantageRow(
                          title:
                              context.t.paywall.advantages.unlimited_tags.title,
                          description: context
                              .t.paywall.advantages.unlimited_tags.description,
                          icon: CupertinoIcons.tags,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.unlimited_habits.title,
                          description: context.t.paywall.advantages
                              .unlimited_habits.description,
                          icon: CupertinoIcons.repeat,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.sync_across_devices.title,
                          description: context.t.paywall.advantages
                              .sync_across_devices.description,
                          icon: CupertinoIcons.cloud,
                        ),
                        _buildAdvantageRow(
                          title: context
                              .t.paywall.advantages.community_backed.title,
                          description: context.t.paywall.advantages
                              .community_backed.description,
                          icon: CupertinoIcons.person_3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: $constants.insets.md,
          ),
          const Divider(),
          SizedBox(
            height: $constants.insets.xs,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: $constants.insets.sm,
                  children: [
                    Expanded(
                      child: ElevatedContainer(
                        height: getSize(context).height * 0.1,
                        borderRadius: $constants.corners.sm,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "test",
                            style: getTextTheme(context)
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedContainer(
                        height: getSize(context).height * 0.1,
                        borderRadius: $constants.corners.sm,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "test",
                            style: getTextTheme(context)
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                PrimaryButtonSquare(
                    text: context.t.actions.subscribe,
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Row(
                  children: [
                    TextButton(
                        child: Text(
                          context.t.paywall.restore_purchase,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: getTheme(context).primary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    TextButton(
                        child: Text(
                          context.t.paywall.terms,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: getTheme(context).primary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    TextButton(
                        child: Text(
                          context.t.paywall.privacy_policy,
                          style: getTextTheme(context).bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: getTheme(context).primary,
                              ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildAdvantageRow({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Icon(
            icon,
            color: getTheme(context).primary,
          ),
        ),
        SizedBox(width: $constants.insets.md),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getTextTheme(context)
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, height: 1),
            ),
            Flexible(
              child: SizedBox(
                width: getSize(context).width * 0.66,
                child: Text(
                  description,
                  style: getTextTheme(context).bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
