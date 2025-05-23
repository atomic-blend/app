import 'package:app/blocs/tag/tag.bloc.dart';
import 'package:app/components/buttons/icon_text_pill.dart';
import 'package:app/components/forms/search_bar.dart';
import 'package:app/entities/tag/tag.entity.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignTagModal extends StatefulWidget {
  final List<TagEntity>? selectedTags;
  final Function(List<TagEntity>)? onSelectedTagsChanged;
  const AssignTagModal(
      {super.key, this.selectedTags, this.onSelectedTagsChanged});

  @override
  State<AssignTagModal> createState() => _AssignTagModalState();
}

class _AssignTagModalState extends State<AssignTagModal> {
  final TextEditingController _searchController = TextEditingController();
  List<TagEntity> _selectedTags = [];

  @override
  void initState() {
    if (widget.selectedTags != null) {
      _selectedTags = widget.selectedTags!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagBloc, TagState>(builder: (context, tagState) {
      return Container(
        height: getSize(context).height * 0.5,
        padding: EdgeInsets.all($constants.insets.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.t.tags.assign_tags,
                  style: getTextTheme(context).titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(CupertinoIcons.xmark_circle_fill)),
              ],
            ),
            SizedBox(
              height: $constants.insets.xs,
            ),
            ABSearchBar(controller: _searchController, onSubmitted: (value) {}),
            SizedBox(
              height: $constants.insets.sm,
            ),
            Row(
              children: [
                ...(tagState.tags ?? []).map(
                  (tag) => Padding(
                    padding: EdgeInsets.only(
                        bottom: $constants.insets.sm,
                        left: $constants.insets.xxs),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedTags
                              .map((e) => e.id)
                              .toList()
                              .contains(tag.id)) {
                            _selectedTags.removeWhere((e) => e.id == tag.id);
                          } else {
                            _selectedTags.add(tag);
                          }
                        });
                        if (widget.onSelectedTagsChanged != null) {
                          widget.onSelectedTagsChanged!(_selectedTags);
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: _selectedTags
                                      .map((e) => e.id)
                                      .toList()
                                      .contains(tag.id)
                                  ? Border.all(
                                      color: getTheme(context).primary,
                                      width: 1,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(
                                $constants.corners.full,
                              ),
                              color: tag.color != null
                                  ? hexToColor(tag.color!).withValues(alpha: 0.2)
                                  : Colors.grey.withValues(alpha: 0.2),
                            ),
                            child: const Icon(CupertinoIcons.tag),
                          ),
                          IconTextPill(
                            title: tag.name,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
