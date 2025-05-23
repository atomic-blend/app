import 'package:app/blocs/app/app.bloc.dart';
import 'package:app/i18n/strings.g.dart';
import 'package:app/utils/constants.dart';
import 'package:app/utils/shortcuts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarSettings extends StatelessWidget {
  const CalendarSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, appState) {
      return Container(
        height: getSize(context).height * 0.8,
        padding: EdgeInsets.all($constants.insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.t.calendar.settings.title,
              style: getTextTheme(context).titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: $constants.insets.md),
            Row(
              children: [
                Text(context.t.calendar.settings.display_habits),
                const Spacer(),
                CupertinoSwitch(
                  value: appState.displayHabitsInCalendar ?? false,
                  onChanged: (newVal) {
                    context
                        .read<AppCubit>()
                        .changeDisplayHabitsInCalendar(value: newVal);
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
