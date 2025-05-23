import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

class PriorityPicker extends StatelessWidget {
  final int? priority;
  final Function(int?)? onChanged;
  final bool? displayCard;

  const PriorityPicker(
      {super.key, this.priority, this.onChanged, this.displayCard});

  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }

  Widget buildList(BuildContext context) {
    return Container(
      width: isDesktop(context)
          ? getSize(context).width * 0.5
          : getSize(context).width * 0.35,
      padding: EdgeInsets.all(
        displayCard == true ? $constants.insets.sm : $constants.insets.xs,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.t.tasks.priority,
            style: displayCard == true
                ? getTextTheme(context).titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                : getTextTheme(context).headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => Padding(
                      padding: EdgeInsets.only(bottom: $constants.insets.xs),
                      child: GestureDetector(
                        onTap: () {
                          onChanged?.call(index);
                          Navigator.of(context).pop();
                        },
                        child: Material(
                          color: getTheme(context).surfaceContainer,
                          elevation: displayCard == true ? 1 : 0,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: displayCard == true
                                ? BoxDecoration(
                                    color: getTheme(context).surface,
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : null,
                            child: Padding(
                              padding: EdgeInsets.all(
                                displayCard == true
                                    ? $constants.insets.md
                                    : $constants.insets.xs,
                              ),
                              child: Row(children: [
                                SizedBox(
                                  width: 24,
                                  child: index == 0
                                      ? const Icon(
                                          CupertinoIcons.flag,
                                          color: Colors.grey,
                                        )
                                      : SizedBox(
                                          width: 6,
                                          child: Icon(CupertinoIcons.flag,
                                              color: index == 0
                                                  ? Colors.grey
                                                  : index == 1
                                                      ? Colors.blueAccent
                                                      : index == 2
                                                          ? Colors
                                                              .deepOrangeAccent
                                                          : Colors.red)),
                                ),
                                SizedBox(
                                  width: displayCard == true
                                      ? $constants.insets.md
                                      : $constants.insets.xs,
                                ),
                                Text(
                                  context.t.tasks.priorities.values
                                      .toList()[index],
                                  style: getTextTheme(context)
                                      .bodyLarge!
                                      .copyWith(),
                                ),
                                if (index == priority ||
                                    index == 0 && priority == null) ...[
                                  const Spacer(),
                                  const Icon(
                                    CupertinoIcons.check_mark,
                                    color: Colors.blueAccent,
                                  )
                                ]
                              ]),
                            ),
                          ),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
