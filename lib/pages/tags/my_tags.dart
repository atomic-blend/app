import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/components/buttons/icon_text_card.dart';
import 'package:app/components/modals/delete_confirm_modal.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/paywall/paywall_utils.dart';
import 'package:app/pages/tags/add_tag_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTags extends StatefulWidget {
  const MyTags({super.key});

  @override
  State<MyTags> createState() => _MyTagsState();
}

class _MyTagsState extends State<MyTags> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Scaffold(
          backgroundColor: getTheme(context).surface,
          appBar: AppBar(
            backgroundColor: getTheme(context).surface,
            title: Text(
              context.t.tags.title,
              style: getTextTheme(context).titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
                return IconButton(
                    onPressed: () {
                      if ((tagState.tags?.length ?? 0) >= 5) {
                        PaywallUtils.showPaywall(context, user: authState.user);
                      }
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => const AddTagModal());
                    },
                    icon: const Icon(CupertinoIcons.add));
              }),
            ],
          ),
          body: BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
              child: Column(
                children: [
                  ...(tagState.tags ?? []).map(
                    (tag) => Padding(
                      padding: EdgeInsets.only(
                        bottom: $constants.insets.xs,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => AddTagModal(tag: tag));
                        },
                        child: Slidable(
                          endActionPane:
                              ActionPane(motion: const ScrollMotion(), children: [
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                  outlinedButtonTheme:
                                      const OutlinedButtonThemeData(
                                style: ButtonStyle(
                                    iconColor: WidgetStatePropertyAll(Colors.white),
                                    iconSize: WidgetStatePropertyAll(25)),
                              )),
                              child: SlidableAction(
                                onPressed: (context) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => DeleteConfirmModal(
                                            title: context.t.tags.delete.title,
                                            description:
                                                context.t.tags.delete.description,
                                            warning: context.t.tags.delete.warning,
                                            onDelete: () {
                                              context
                                                  .read<TagBloc>()
                                                  .add(DeleteTag(tag.id!));
                                            },
                                          ));
                                },
                                backgroundColor: getTheme(context).error,
                                foregroundColor: Colors.white,
                                icon: CupertinoIcons.delete,
                                borderRadius: BorderRadius.circular(
                                  $constants.corners.sm,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: $constants.insets.xs,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                  outlinedButtonTheme:
                                      const OutlinedButtonThemeData(
                                style: ButtonStyle(
                                    iconColor: WidgetStatePropertyAll(Colors.white),
                                    iconSize: WidgetStatePropertyAll(30)),
                              )),
                              child: SlidableAction(
                                onPressed: (context) {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => AddTagModal(tag: tag));
                                },
                                backgroundColor: getTheme(context).surfaceContainer,
                                foregroundColor: getTheme(context).onSurface,
                                icon: CupertinoIcons.pencil,
                                borderRadius: BorderRadius.circular(
                                  $constants.corners.sm,
                                ),
                              ),
                            ),
                          ]),
                          child: IconTextCard(
                            width: double.infinity,
                            title: tag.name,
                            icon: CupertinoIcons.tag,
                            color: tag.color != null
                                ? hexToColor(tag.color!).withValues(alpha: 0.2)
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      }
    );
  }
}
