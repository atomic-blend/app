import 'package:app/blocs/tasks/tasks.bloc.dart';
import 'package:app/pages/conflicted_item/conflicted_item_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConflictedItemWrapper extends StatefulWidget {
  final bool? enableConflictedItemCard;
  final Widget child;
  const ConflictedItemWrapper(
      {super.key, this.enableConflictedItemCard, required this.child});

  @override
  State<ConflictedItemWrapper> createState() => _ConflictedItemWrapperState();
}

class _ConflictedItemWrapperState extends State<ConflictedItemWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, taskState) {
      final taskConflictedItems = taskState.latestSync?.conflicts ?? [];
      return Column(
        children: [
          if (widget.enableConflictedItemCard ?? false)
            ConflictedItemInfoCard(),
          widget.child,
        ],
      );
    });
  }
}
