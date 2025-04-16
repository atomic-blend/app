import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/components/buttons/icon_text_card.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/pages/tags/add_tag_modal.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTags extends StatefulWidget {
  const MyTags({super.key});

  @override
  State<MyTags> createState() => _MyTagsState();
}

class _MyTagsState extends State<MyTags> {
  @override
  Widget build(BuildContext context) {
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
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, isScrollControlled: true, builder: (context) => const AddTagModal());
              },
              icon: const Icon(CupertinoIcons.add)),
        ],
      ),
      body: BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: $constants.insets.sm, vertical: $constants.insets.xs),
          child: Column(
            children: [
              ...(tagState.tags ?? []).map(
                (tag) => IconTextCard(
                  width: double.infinity,
                  title: tag.name,
                  icon: CupertinoIcons.tag,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
