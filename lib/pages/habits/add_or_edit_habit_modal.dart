import 'package:app/entities/habit/habit.entity.dart';
import 'package:app/pages/habits/add_habits_modal.dart';
import 'package:app/pages/habits/habit_detail.dart';
import 'package:flutter/material.dart';

class ViewOrEditHabitModal extends StatefulWidget {
  final Habit? habit;
  final bool? isEdit;
  const ViewOrEditHabitModal({super.key, this.habit, this.isEdit});

  @override
  State<ViewOrEditHabitModal> createState() => _ViewOrEditHabitModalState();
}

class _ViewOrEditHabitModalState extends State<ViewOrEditHabitModal> {
  bool? _isEdit = false;

  @override
  void initState() {
    _isEdit = widget.isEdit ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEdit == true) {
      return AddHabitModal(
        habit: widget.habit,
        onEditEnd: () {
          setState(() {
            _isEdit = false;
          });
        },
      );
    } else {
      return HabitDetail(
        habit: widget.habit!,
        onEdit: () {
          setState(() {
            _isEdit = true;
          });
        },
      );
    }
  }
}
