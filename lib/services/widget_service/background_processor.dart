// Called when Doing Background Work initiated from Widget
import 'package:home_widget/home_widget.dart';

Future<void> backgroundCallback(Uri? uri) async {
  if (uri?.host == 'updatecounter') {
    int counter = 0;
    await HomeWidget.getWidgetData<int>('_counter', defaultValue: 0)
        .then((value) {
      counter = value ?? 0;
      counter++;
    });
    await HomeWidget.saveWidgetData<int>('_counter', counter);
    await HomeWidget.updateWidget(
        name: 'AppWidgetProvider', iOSName: 'AppWidgetProvider');
  }
}
