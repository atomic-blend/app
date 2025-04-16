import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tags/my_tags.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagsView extends StatefulWidget {
  const TagsView({super.key});

  @override
  State<TagsView> createState() => _TagsViewState();
}

class _TagsViewState extends State<TagsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: $constants.insets.sm,
          vertical: $constants.insets.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: $constants.insets.xxs),
                  child: AutoSizeText(
                    context.t.tasks.my_tags,
                    style: getTextTheme(context).titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  width: $constants.insets.sm,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyTags()));
                  },
                  child: Text(
                    context.t.actions.edit,
                    style: getTextTheme(context).bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getTheme(context).primary,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...(tagState.tags ?? [])
                    .map((tag) => IconTextPill(title: tag.name, icon: null))
              ],
            )
          ],
        ),
      );
    });
  }
}
