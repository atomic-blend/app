import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

class PriorityPicker extends StatelessWidget {
  final int? priority;
  final Function(int?)? onChanged;

  const PriorityPicker({super.key, this.priority, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width * 0.35,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Priority',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                4,
                (index) => GestureDetector(
                      onTap: () {
                        onChanged?.call(index);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: $constants.insets.xs),
                        child: Row(children: [
                          SizedBox(
                            width: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: index == 0
                                  ? [
                                      const Icon(
                                        CupertinoIcons.exclamationmark,
                                        color: Colors.grey,
                                      ),
                                    ]
                                  : List.generate(
                                      index,
                                      (_) => SizedBox(
                                          width: 6,
                                          child: Icon(
                                              CupertinoIcons.exclamationmark,
                                              color: index == 0
                                                  ? Colors.grey
                                                  : index == 1
                                                      ? Colors.blueAccent
                                                      : index == 2
                                                          ? Colors
                                                              .deepOrangeAccent
                                                          : Colors.red)),
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: $constants.insets.xs,
                          ),
                          Text(
                            context.t.tasks.priorities.values.toList()[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (index == priority ||
                              index == 0 && priority == null) ...[
                            Spacer(),
                            const Icon(
                              CupertinoIcons.check_mark,
                              color: Colors.blueAccent,
                            )
                          ]
                        ]),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
