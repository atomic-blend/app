///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Atomic Blend'
	String get app_name => 'Atomic Blend';

	/// en: 'Atomic Blend Cloud'
	String get app_name_saas => 'Atomic Blend Cloud';

	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsTagsEn tags = TranslationsTagsEn._(_root);
	late final TranslationsTasksEn tasks = TranslationsTasksEn._(_root);
	late final TranslationsCalendarEn calendar = TranslationsCalendarEn._(_root);
	late final TranslationsHabitsEn habits = TranslationsHabitsEn._(_root);
	late final TranslationsUnderConstructionEn under_construction = TranslationsUnderConstructionEn._(_root);
	late final TranslationsMoreEn more = TranslationsMoreEn._(_root);
	Map<String, String> get date_modes => {
		'date': 'Date',
		'duration': 'Duration',
	};
	late final TranslationsTimesEn times = TranslationsTimesEn._(_root);
	Map<String, String> get days_of_week => {
		'monday': 'Monday',
		'tuesday': 'Tuesday',
		'wednesday': 'Wednesday',
		'thursday': 'Thursday',
		'friday': 'Friday',
		'saturday': 'Saturday',
		'sunday': 'Sunday',
	};
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	Map<String, String> get errors => {
		'wrong_email_password': 'Email or password incorrect',
		'email_malformed': 'Email malformed',
		'unknown_error': 'Unknown error',
	};
	late final TranslationsAccountEn account = TranslationsAccountEn._(_root);
	late final TranslationsNotificationsEn notifications = TranslationsNotificationsEn._(_root);
	late final TranslationsTimeUnitsEn time_units = TranslationsTimeUnitsEn._(_root);
	late final TranslationsEisenhowerEn eisenhower = TranslationsEisenhowerEn._(_root);
	late final TranslationsInboxEn inbox = TranslationsInboxEn._(_root);
	late final TranslationsTimerEn timer = TranslationsTimerEn._(_root);
	late final TranslationsSearchEn search = TranslationsSearchEn._(_root);
	late final TranslationsSyncEn sync = TranslationsSyncEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsAppSettingsEn app_settings = TranslationsSettingsAppSettingsEn._(_root);

	/// en: 'Logout'
	String get logout => 'Logout';
}

// Path: tags
class TranslationsTagsEn {
	TranslationsTagsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tags'
	String get title => 'Tags';

	/// en: 'Assign tags'
	String get assign_tags => 'Assign tags';

	late final TranslationsTagsAddModalEn add_modal = TranslationsTagsAddModalEn._(_root);
	late final TranslationsTagsDeleteEn delete = TranslationsTagsDeleteEn._(_root);
}

// Path: tasks
class TranslationsTasksEn {
	TranslationsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tasks'
	String get title => 'Tasks';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: 'Inbox'
	String get inbox => 'Inbox';

	/// en: 'Tags'
	String get tags => 'Tags';

	/// en: 'All tasks'
	String get all_tasks => 'All tasks';

	/// en: 'Completed tasks'
	String get completed_tasks => 'Completed tasks';

	/// en: 'My tags'
	String get my_tags => 'My tags';

	/// en: 'No tags for now'
	String get no_tags_for_now => 'No tags for now';

	/// en: 'My folders'
	String get my_folders => 'My folders';

	late final TranslationsTasksFoldersEn folders = TranslationsTasksFoldersEn._(_root);

	/// en: 'Nothing to do for now, enjoy your day!'
	String get nothing_to_do => 'Nothing to do for now, enjoy your day!';

	/// en: 'You have nothing planned for tomorrow, enjoy your day!'
	String get day_off => 'You have nothing planned for tomorrow, enjoy your day!';

	/// en: 'No tasks for now'
	String get no_tasks_for_now => 'No tasks for now';

	/// en: 'Time Log'
	String get time_log => 'Time Log';

	/// en: 'Log session'
	String get log_session => 'Log session';

	/// en: 'Timer'
	String get timer => 'Timer';

	/// en: 'Pomodoro'
	String get pomodoro => 'Pomodoro';

	/// en: 'Manual'
	String get manual => 'Manual';

	/// en: 'From'
	String get from => 'From';

	/// en: 'To'
	String get to => 'To';

	/// en: 'Priority'
	String get priority => 'Priority';

	Map<String, String> get priorities => {
		'none': 'None',
		'low': 'Low',
		'medium': 'Medium',
		'high': 'High',
	};
	late final TranslationsTasksDueDatesEn due_dates = TranslationsTasksDueDatesEn._(_root);
	late final TranslationsTasksAddTaskModalEn add_task_modal = TranslationsTasksAddTaskModalEn._(_root);

	/// en: 'Time spent'
	String get time_spent => 'Time spent';

	/// en: 'No time entries for now'
	String get no_time_entries => 'No time entries for now';

	late final TranslationsTasksAddTimeEntryEn add_time_entry = TranslationsTasksAddTimeEntryEn._(_root);
	late final TranslationsTasksConflictDetectedModalEn conflict_detected_modal = TranslationsTasksConflictDetectedModalEn._(_root);
}

// Path: calendar
class TranslationsCalendarEn {
	TranslationsCalendarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Calendar'
	String get title => 'Calendar';

	/// en: 'Month'
	String get month => 'Month';

	/// en: 'Day'
	String get day => 'Day';

	/// en: '3 Days'
	String get threeDays => '3 Days';

	/// en: 'Week'
	String get week => 'Week';

	/// en: 'Schedule'
	String get schedule => 'Schedule';

	late final TranslationsCalendarErrorsEn errors = TranslationsCalendarErrorsEn._(_root);
	late final TranslationsCalendarEventDetailEn event_detail = TranslationsCalendarEventDetailEn._(_root);
	late final TranslationsCalendarSettingsEn settings = TranslationsCalendarSettingsEn._(_root);
}

// Path: habits
class TranslationsHabitsEn {
	TranslationsHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Habits'
	String get title => 'Habits';

	/// en: 'No habits for now'
	String get no_habits => 'No habits for now';

	/// en: 'Add your first habit to get started!'
	String get get_started_now => 'Add your first habit to get started!';

	late final TranslationsHabitsDeleteHabitEn delete_habit = TranslationsHabitsDeleteHabitEn._(_root);
	late final TranslationsHabitsAddEn add = TranslationsHabitsAddEn._(_root);

	/// en: 'Habits'
	String get list => 'Habits';

	/// en: 'Overview'
	String get overview => 'Overview';

	/// en: '${nb} times a day'
	String times_a_day({required Object nb}) => '${nb} times a day';

	/// en: '${nb} times a week'
	String times_a_week({required Object nb}) => '${nb} times a week';

	/// en: '${nb} times a month'
	String times_a_month({required Object nb}) => '${nb} times a month';

	late final TranslationsHabitsHabitDetailEn habit_detail = TranslationsHabitsHabitDetailEn._(_root);
}

// Path: under_construction
class TranslationsUnderConstructionEn {
	TranslationsUnderConstructionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'We're working on it!'
	String get title => 'We\'re working on it!';

	/// en: 'This feature is not yet available, but we're working hard to bring it to you soon. Stay tuned!'
	String get description => 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
}

// Path: more
class TranslationsMoreEn {
	TranslationsMoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'More'
	String get title => 'More';
}

// Path: times
class TranslationsTimesEn {
	TranslationsTimesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'This week'
	String get this_week => 'This week';

	/// en: '(zero) {${nb} minutes} (one) {${nb} minute} (other) {${nb} minutes}'
	String minutes({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: '${nb} minutes',
		one: '${nb} minute',
		other: '${nb} minutes',
	);
}

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: account
class TranslationsAccountEn {
	TranslationsAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Account'
	String get title => 'Account';
}

// Path: notifications
class TranslationsNotificationsEn {
	TranslationsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The task is due'
	String get task_due_now => 'The task is due';

	/// en: 'The task is starting'
	String get task_starting => 'The task is starting';

	/// en: 'The task is starting in ${time}'
	String task_starting_in({required Object time}) => 'The task is starting in ${time}';

	/// en: 'Perform the habit now, one less thing to do!'
	String get habit_due_now => 'Perform the habit now, one less thing to do!';
}

// Path: time_units
class TranslationsTimeUnitsEn {
	TranslationsTimeUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTimeUnitsShortEn short = TranslationsTimeUnitsShortEn._(_root);
	late final TranslationsTimeUnitsLongEn long = TranslationsTimeUnitsLongEn._(_root);
}

// Path: eisenhower
class TranslationsEisenhowerEn {
	TranslationsEisenhowerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Eisenhower'
	String get small_title => 'Eisenhower';

	/// en: 'Eisenhower Matrix'
	String get title => 'Eisenhower Matrix';
}

// Path: inbox
class TranslationsInboxEn {
	TranslationsInboxEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Inbox'
	String get title => 'Inbox';
}

// Path: timer
class TranslationsTimerEn {
	TranslationsTimerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Timer'
	String get title => 'Timer';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Stop'
	String get stop => 'Stop';

	/// en: 'Pause'
	String get pause => 'Pause';

	/// en: 'Duration'
	String get duration => 'Duration';

	/// en: 'Start pomodoro'
	String get start_pomodoro => 'Start pomodoro';

	/// en: 'Start stopwatch'
	String get start_stopwatch => 'Start stopwatch';

	/// en: 'Pomodoro running'
	String get pomo_running => 'Pomodoro running';

	/// en: 'Timer running'
	String get timer_running => 'Timer running';

	/// en: 'Time left: ${timeLeft}'
	String time_left({required Object timeLeft}) => 'Time left: ${timeLeft}';

	/// en: 'Start break'
	String get start_break => 'Start break';

	/// en: 'Elapsed time'
	String get elapsed_time => 'Elapsed time';

	Map<String, String> get modes => {
		'pomodoro': 'Pomodoro',
		'stopwatch': 'Stopwatch',
	};

	/// en: 'Select a task'
	String get select_task => 'Select a task';

	/// en: 'Completed!'
	String get completed => 'Completed!';

	/// en: 'Your pomodoro session has completed! Time for a break.'
	String get pomodoro_completed_message => 'Your pomodoro session has completed! Time for a break.';

	/// en: 'Your stopwatch session has been completed.'
	String get stopwatch_completed_message => 'Your stopwatch session has been completed.';

	/// en: 'Task'
	String get task_label => 'Task';
}

// Path: search
class TranslationsSearchEn {
	TranslationsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search'
	String get title => 'Search';

	/// en: '(zero) {No results found} (one) {1 result found} (other) {${n} results found}'
	String results({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No results found',
		one: '1 result found',
		other: '${n} results found',
	);
}

// Path: sync
class TranslationsSyncEn {
	TranslationsSyncEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Synchronization'
	String get title => 'Synchronization';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Up to date'
	String get up_to_date => 'Up to date';

	/// en: 'Conflicts'
	String get conflicts => 'Conflicts';

	/// en: '(zero) {No items have conflicts} (one) {1 item has conflicts} (other) {${n} items have conflicts}'
	String x_items_have_conflicts({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No items have conflicts',
		one: '1 item has conflicts',
		other: '${n} items have conflicts',
	);

	late final TranslationsSyncDetailsEn details = TranslationsSyncDetailsEn._(_root);

	/// en: 'Sync now'
	String get sync_now => 'Sync now';

	late final TranslationsSyncConflictResolverEn conflict_resolver = TranslationsSyncConflictResolverEn._(_root);
}

// Path: settings.app_settings
class TranslationsSettingsAppSettingsEn {
	TranslationsSettingsAppSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'App Settings'
	String get title => 'App Settings';

	late final TranslationsSettingsAppSettingsSelfHostedUrlEn selfHostedUrl = TranslationsSettingsAppSettingsSelfHostedUrlEn._(_root);
}

// Path: tags.add_modal
class TranslationsTagsAddModalEn {
	TranslationsTagsAddModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a new tag'
	String get title => 'Add a new tag';

	/// en: 'Edit tag'
	String get edit_title => 'Edit tag';

	/// en: 'Name of the tag'
	String get name => 'Name of the tag';

	/// en: 'Work'
	String get name_hint => 'Work';

	/// en: 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.'
	String get color_description => 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.';
}

// Path: tags.delete
class TranslationsTagsDeleteEn {
	TranslationsTagsDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete tag'
	String get title => 'Delete tag';

	/// en: 'Are you sure you want to delete this tag?'
	String get description => 'Are you sure you want to delete this tag?';

	/// en: 'This action cannot be undone and the tag will be removed from all tags associated.'
	String get warning => 'This action cannot be undone and the tag will be removed from all tags associated.';
}

// Path: tasks.folders
class TranslationsTasksFoldersEn {
	TranslationsTasksFoldersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Folders'
	String get title => 'Folders';

	/// en: 'No folders for now'
	String get no_folders => 'No folders for now';

	/// en: 'Add a folder'
	String get add_folder => 'Add a folder';

	/// en: 'Edit folder'
	String get edit_folder => 'Edit folder';

	/// en: 'Delete folder'
	String get delete_folder => 'Delete folder';

	/// en: 'Are you sure you want to delete this folder?'
	String get delete_folder_description => 'Are you sure you want to delete this folder?';

	/// en: 'This action cannot be undone and all the tasks will be unlinked'
	String get delete_folder_warning => 'This action cannot be undone and all the tasks will be unlinked';

	/// en: 'Name of the folder'
	String get name => 'Name of the folder';

	/// en: 'Work'
	String get name_hint => 'Work';

	/// en: 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Color'
	String get color => 'Color';

	/// en: 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.'
	String get color_description => 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Select a folder'
	String get select_a_folder => 'Select a folder';
}

// Path: tasks.due_dates
class TranslationsTasksDueDatesEn {
	TranslationsTasksDueDatesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'Tomorrow'
	String get tomorrow => 'Tomorrow';

	/// en: 'No due date'
	String get no_due_date => 'No due date';
}

// Path: tasks.add_task_modal
class TranslationsTasksAddTaskModalEn {
	TranslationsTasksAddTaskModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What do you need to do?'
	String get task_title => 'What do you need to do?';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Dates'
	String get dates => 'Dates';

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'Start Date'
	String get start_date => 'Start Date';

	/// en: 'End Date'
	String get end_date => 'End Date';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Erase'
	String get erase => 'Erase';

	/// en: 'Task added'
	String get task_added => 'Task added';

	/// en: 'Your task has been added successfully.'
	String get task_added_description => 'Your task has been added successfully.';

	/// en: 'Task error'
	String get task_error => 'Task error';

	/// en: 'Title required'
	String get title_required => 'Title required';

	/// en: 'Please enter a title for your task'
	String get title_required_description => 'Please enter a title for your task';

	/// en: '(zero) {Reminder} (one) {Reminder} (other) {Reminders}'
	String reminders({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Reminder',
		one: 'Reminder',
		other: 'Reminders',
	);

	/// en: 'Expected time'
	String get time_planned => 'Expected time';

	/// en: 'None'
	String get none => 'None';

	/// en: 'No reminders'
	String get no_reminders => 'No reminders';

	/// en: 'When would you like to be reminded?'
	String get when_would_you_like_to_be_reminded => 'When would you like to be reminded?';

	/// en: 'When would you like the task to start?'
	String get when_would_you_like_the_task_to_start => 'When would you like the task to start?';

	/// en: 'When would you like the task to end?'
	String get when_would_you_like_the_task_to_end => 'When would you like the task to end?';
}

// Path: tasks.add_time_entry
class TranslationsTasksAddTimeEntryEn {
	TranslationsTasksAddTimeEntryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Add a time entry'
	String get title => 'Add a time entry';

	/// en: 'Manually add a time entry for this task.'
	String get description => 'Manually add a time entry for this task.';

	/// en: 'Start time'
	String get start_time => 'Start time';

	/// en: 'End time'
	String get end_time => 'End time';

	/// en: 'Not defined'
	String get not_defined => 'Not defined';
}

// Path: tasks.conflict_detected_modal
class TranslationsTasksConflictDetectedModalEn {
	TranslationsTasksConflictDetectedModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Conflict Detected'
	String get title => 'Conflict Detected';

	/// en: 'Previous edits of this task made while offline conflicts with the current version of the task.'
	String get description => 'Previous edits of this task made while offline conflicts with the current version of the task.';

	/// en: 'You can either resolve the conflicts now or come back later to resolve them.'
	String get warning => 'You can either resolve the conflicts now or come back later to resolve them.';

	/// en: 'Resolve'
	String get resolve_now => 'Resolve';

	/// en: 'Later'
	String get later => 'Later';
}

// Path: calendar.errors
class TranslationsCalendarErrorsEn {
	TranslationsCalendarErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'You cannot move a device calendar event'
	String get cannot_move_device_calendar_event => 'You cannot move a device calendar event';

	/// en: 'You cannot move a habit event'
	String get cannot_move_habit_event => 'You cannot move a habit event';

	/// en: 'You cannot resize a device calendar event'
	String get cannot_resize_device_calendar_event => 'You cannot resize a device calendar event';

	/// en: 'You cannot resize a habit event'
	String get cannot_resize_habit_event => 'You cannot resize a habit event';
}

// Path: calendar.event_detail
class TranslationsCalendarEventDetailEn {
	TranslationsCalendarEventDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Organizer'
	String get organizer => 'Organizer';

	/// en: 'Reminder'
	String get reminders => 'Reminder';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Join meeting'
	String get join_meeting => 'Join meeting';

	/// en: 'Google Meet Call'
	String get google_meet_call => 'Google Meet Call';

	/// en: 'Zoom Call'
	String get zoom_meet_call => 'Zoom Call';

	/// en: 'MS Teams Call'
	String get ms_teams_call => 'MS Teams Call';

	/// en: 'Join now'
	String get join_now => 'Join now';

	/// en: '(zero) {Attendee} (one) {Attendee} (other) {Attendees}'
	String attendee({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Attendee',
		one: 'Attendee',
		other: 'Attendees',
	);
}

// Path: calendar.settings
class TranslationsCalendarSettingsEn {
	TranslationsCalendarSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Calendar Settings'
	String get title => 'Calendar Settings';

	/// en: 'Display habits'
	String get display_habits => 'Display habits';
}

// Path: habits.delete_habit
class TranslationsHabitsDeleteHabitEn {
	TranslationsHabitsDeleteHabitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete habit'
	String get title => 'Delete habit';

	/// en: 'Are you sure you want to delete this habit?'
	String get description => 'Are you sure you want to delete this habit?';

	/// en: 'This action cannot be undone and all the related entries will also be deleted.'
	String get warning => 'This action cannot be undone and all the related entries will also be deleted.';
}

// Path: habits.add
class TranslationsHabitsAddEn {
	TranslationsHabitsAddEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'What do you want to achieve?'
	String get title => 'What do you want to achieve?';

	/// en: 'Habit name*'
	String get name => 'Habit name*';

	/// en: 'Drink water'
	String get name_hint => 'Drink water';

	/// en: 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.'
	String get name_description => 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.';

	/// en: 'Name is required'
	String get name_required => 'Name is required';

	/// en: 'Citation'
	String get citation => 'Citation';

	/// en: 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.'
	String get citation_description => 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.';

	/// en: '“Water is the only drink for a wise man.” — Henry David Thoreau'
	String get citation_hint => '“Water is the only drink for a wise man.” — Henry David Thoreau';

	/// en: 'Start date'
	String get start_date => 'Start date';

	/// en: 'End date'
	String get end_date => 'End date';

	/// en: 'When would you like the habit to start?'
	String get when_would_you_like_the_habit_to_start => 'When would you like the habit to start?';

	/// en: 'When would you like the habit to end?'
	String get when_would_you_like_the_habit_to_end => 'When would you like the habit to end?';

	/// en: 'No date selected'
	String get no_date_selected => 'No date selected';

	/// en: 'Frequency'
	String get frequency_label => 'Frequency';

	Map<String, String> get frequency => {
		'daily': 'Daily',
		'weekly': 'Weekly',
		'monthly': 'Monthly',
		'repeatition': 'Repeatition',
	};

	/// en: 'Number of times'
	String get number_of_times_label => 'Number of times';

	/// en: 'How many times do you want to do this habit? Each time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).'
	String get number_of_times_description => 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).';

	/// en: 'Days of the week'
	String get days_of_week_label => 'Days of the week';

	/// en: 'On which days of the week do you want to do this habit?'
	String get days_of_week_description => 'On which days of the week do you want to do this habit?';

	/// en: 'Search for an emoji'
	String get search_emoji_hint => 'Search for an emoji';

	/// en: 'Reminders'
	String get reminders_label => 'Reminders';

	/// en: 'Set a time for your reminders. You will be notified when the time is reached.'
	String get reminders_description => 'Set a time for your reminders. You will be notified when the time is reached.';

	/// en: 'Add a reminder'
	String get reminders_add => 'Add a reminder';

	/// en: 'Duration'
	String get duration_label => 'Duration';

	/// en: 'How long do you want to do this habit?'
	String get duration_description => 'How long do you want to do this habit?';

	/// en: '5 minutes'
	String get duration_hint => '5 minutes';

	/// en: 'You must select the same number of days as the number of times'
	String get days_of_week_mismatch => 'You must select the same number of days as the number of times';

	/// en: 'Repeatition in days'
	String get every_number_day_title => 'Repeatition in days';

	/// en: 'How many days do you want to wait before repeating this habit?'
	String get every_number_day_description => 'How many days do you want to wait before repeating this habit?';

	/// en: 'Days of the month'
	String get days_of_month_title => 'Days of the month';

	/// en: 'On which days of the month do you want to do this habit?'
	String get days_of_month_description => 'On which days of the month do you want to do this habit?';

	/// en: 'Select days'
	String get select_days => 'Select days';
}

// Path: habits.habit_detail
class TranslationsHabitsHabitDetailEn {
	TranslationsHabitsHabitDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No citation'
	String get no_citation => 'No citation';

	/// en: 'No end date'
	String get no_end_date => 'No end date';

	/// en: 'Delete habit'
	String get delete_habit => 'Delete habit';

	/// en: 'Are you sure you want to delete this habit?'
	String get delete_habit_description => 'Are you sure you want to delete this habit?';

	/// en: 'This action cannot be undone and all the related entries will also be deleted.'
	String get delete_habit_warning => 'This action cannot be undone and all the related entries will also be deleted.';

	/// en: 'Entries'
	String get entries => 'Entries';

	/// en: 'No entries for now'
	String get no_entries => 'No entries for now';

	/// en: 'Delete entry'
	String get delete_entry => 'Delete entry';

	/// en: 'Are you sure you want to delete this entry?'
	String get delete_entry_description => 'Are you sure you want to delete this entry?';

	/// en: 'This action cannot be undone.'
	String get delete_entry_warning => 'This action cannot be undone.';
}

// Path: time_units.short
class TranslationsTimeUnitsShortEn {
	TranslationsTimeUnitsShortEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'd'
	String get day => 'd';

	/// en: 'h'
	String get hour => 'h';

	/// en: 'm'
	String get minute => 'm';
}

// Path: time_units.long
class TranslationsTimeUnitsLongEn {
	TranslationsTimeUnitsLongEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: '(zero) {days} (one) {day} (other) {days}'
	String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'days',
		one: 'day',
		other: 'days',
	);

	/// en: '(zero) {hours} (one) {hour} (other) {hours}'
	String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'hours',
		one: 'hour',
		other: 'hours',
	);

	/// en: '(zero) {minutes} (one) {minute} (other) {minutes}'
	String minute({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'minutes',
		one: 'minute',
		other: 'minutes',
	);
}

// Path: sync.details
class TranslationsSyncDetailsEn {
	TranslationsSyncDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Details'
	String get title => 'Details';

	/// en: 'Tasks'
	String get tasks => 'Tasks';

	/// en: '(zero) {No tasks} (one) {1 task} (other) {${n} tasks}'
	String task_items({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'No tasks',
		one: '1 task',
		other: '${n} tasks',
	);
}

// Path: sync.conflict_resolver
class TranslationsSyncConflictResolverEn {
	TranslationsSyncConflictResolverEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Conflict Resolver'
	String get title => 'Conflict Resolver';

	/// en: 'Choose between accepting or refusing the changes'
	String get choose_between => 'Choose between accepting or refusing the changes';

	/// en: 'Refuse'
	String get refuse => 'Refuse';

	/// en: 'Accept'
	String get accept => 'Accept';

	/// en: 'In-app'
	String get in_app_version => 'In-app';

	/// en: 'Changes to apply'
	String get changes_to_apply => 'Changes to apply';

	/// en: 'Apply decision to all conflicts'
	String get apply_to_all => 'Apply decision to all conflicts';

	Map<String, dynamic> get fields => {
		'title': 'Title',
		'end_date': 'End date',
		'description': 'Notes',
		'start_date': 'Start date',
		'reminders_title': 'Reminders',
		'reminders': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
			zero: 'No reminders',
			one: '1 reminder',
			other: '${n} reminders',
		),
		'undefined': 'Undefined',
		'priority': 'Priority',
		'folder': 'Folder',
		'tags': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
			zero: 'No tags',
			one: '1 tag',
			other: '${n} tags',
		),
	};

	/// en: 'Progress'
	String get progress => 'Progress';
}

// Path: settings.app_settings.selfHostedUrl
class TranslationsSettingsAppSettingsSelfHostedUrlEn {
	TranslationsSettingsAppSettingsSelfHostedUrlEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Self-Hosted URL'
	String get title => 'Self-Hosted URL';

	/// en: 'Not set'
	String get not_set => 'Not set';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Atomic Blend',
			'app_name_saas' => 'Atomic Blend Cloud',
			'settings.title' => 'Settings',
			'settings.app_settings.title' => 'App Settings',
			'settings.app_settings.selfHostedUrl.title' => 'Self-Hosted URL',
			'settings.app_settings.selfHostedUrl.not_set' => 'Not set',
			'settings.logout' => 'Logout',
			'tags.title' => 'Tags',
			'tags.assign_tags' => 'Assign tags',
			'tags.add_modal.title' => 'Add a new tag',
			'tags.add_modal.edit_title' => 'Edit tag',
			'tags.add_modal.name' => 'Name of the tag',
			'tags.add_modal.name_hint' => 'Work',
			'tags.add_modal.name_description' => 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.',
			'tags.add_modal.name_required' => 'Name is required',
			'tags.add_modal.color' => 'Color',
			'tags.add_modal.color_description' => 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.',
			'tags.delete.title' => 'Delete tag',
			'tags.delete.description' => 'Are you sure you want to delete this tag?',
			'tags.delete.warning' => 'This action cannot be undone and the tag will be removed from all tags associated.',
			'tasks.title' => 'Tasks',
			'tasks.today' => 'Today',
			'tasks.overview' => 'Overview',
			'tasks.inbox' => 'Inbox',
			'tasks.tags' => 'Tags',
			'tasks.all_tasks' => 'All tasks',
			'tasks.completed_tasks' => 'Completed tasks',
			'tasks.my_tags' => 'My tags',
			'tasks.no_tags_for_now' => 'No tags for now',
			'tasks.my_folders' => 'My folders',
			'tasks.folders.title' => 'Folders',
			'tasks.folders.no_folders' => 'No folders for now',
			'tasks.folders.add_folder' => 'Add a folder',
			'tasks.folders.edit_folder' => 'Edit folder',
			'tasks.folders.delete_folder' => 'Delete folder',
			'tasks.folders.delete_folder_description' => 'Are you sure you want to delete this folder?',
			'tasks.folders.delete_folder_warning' => 'This action cannot be undone and all the tasks will be unlinked',
			'tasks.folders.name' => 'Name of the folder',
			'tasks.folders.name_hint' => 'Work',
			'tasks.folders.name_description' => 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.',
			'tasks.folders.name_required' => 'Name is required',
			'tasks.folders.color' => 'Color',
			'tasks.folders.color_description' => 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.',
			'tasks.folders.select_a_folder' => 'Select a folder',
			'tasks.nothing_to_do' => 'Nothing to do for now, enjoy your day!',
			'tasks.day_off' => 'You have nothing planned for tomorrow, enjoy your day!',
			'tasks.no_tasks_for_now' => 'No tasks for now',
			'tasks.time_log' => 'Time Log',
			'tasks.log_session' => 'Log session',
			'tasks.timer' => 'Timer',
			'tasks.pomodoro' => 'Pomodoro',
			'tasks.manual' => 'Manual',
			'tasks.from' => 'From',
			'tasks.to' => 'To',
			'tasks.priority' => 'Priority',
			'tasks.priorities.none' => 'None',
			'tasks.priorities.low' => 'Low',
			'tasks.priorities.medium' => 'Medium',
			'tasks.priorities.high' => 'High',
			'tasks.due_dates.today' => 'Today',
			'tasks.due_dates.tomorrow' => 'Tomorrow',
			'tasks.due_dates.no_due_date' => 'No due date',
			'tasks.add_task_modal.task_title' => 'What do you need to do?',
			'tasks.add_task_modal.description' => 'Description',
			'tasks.add_task_modal.dates' => 'Dates',
			'tasks.add_task_modal.notes' => 'Notes',
			'tasks.add_task_modal.start_date' => 'Start Date',
			'tasks.add_task_modal.end_date' => 'End Date',
			'tasks.add_task_modal.cancel' => 'Cancel',
			'tasks.add_task_modal.save' => 'Save',
			'tasks.add_task_modal.erase' => 'Erase',
			'tasks.add_task_modal.task_added' => 'Task added',
			'tasks.add_task_modal.task_added_description' => 'Your task has been added successfully.',
			'tasks.add_task_modal.task_error' => 'Task error',
			'tasks.add_task_modal.title_required' => 'Title required',
			'tasks.add_task_modal.title_required_description' => 'Please enter a title for your task',
			'tasks.add_task_modal.reminders' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'Reminder', one: 'Reminder', other: 'Reminders', ), 
			'tasks.add_task_modal.time_planned' => 'Expected time',
			'tasks.add_task_modal.none' => 'None',
			'tasks.add_task_modal.no_reminders' => 'No reminders',
			'tasks.add_task_modal.when_would_you_like_to_be_reminded' => 'When would you like to be reminded?',
			'tasks.add_task_modal.when_would_you_like_the_task_to_start' => 'When would you like the task to start?',
			'tasks.add_task_modal.when_would_you_like_the_task_to_end' => 'When would you like the task to end?',
			'tasks.time_spent' => 'Time spent',
			'tasks.no_time_entries' => 'No time entries for now',
			'tasks.add_time_entry.title' => 'Add a time entry',
			'tasks.add_time_entry.description' => 'Manually add a time entry for this task.',
			'tasks.add_time_entry.start_time' => 'Start time',
			'tasks.add_time_entry.end_time' => 'End time',
			'tasks.add_time_entry.not_defined' => 'Not defined',
			'tasks.conflict_detected_modal.title' => 'Conflict Detected',
			'tasks.conflict_detected_modal.description' => 'Previous edits of this task made while offline conflicts with the current version of the task.',
			'tasks.conflict_detected_modal.warning' => 'You can either resolve the conflicts now or come back later to resolve them.',
			'tasks.conflict_detected_modal.resolve_now' => 'Resolve',
			'tasks.conflict_detected_modal.later' => 'Later',
			'calendar.title' => 'Calendar',
			'calendar.month' => 'Month',
			'calendar.day' => 'Day',
			'calendar.threeDays' => '3 Days',
			'calendar.week' => 'Week',
			'calendar.schedule' => 'Schedule',
			'calendar.errors.cannot_move_device_calendar_event' => 'You cannot move a device calendar event',
			'calendar.errors.cannot_move_habit_event' => 'You cannot move a habit event',
			'calendar.errors.cannot_resize_device_calendar_event' => 'You cannot resize a device calendar event',
			'calendar.errors.cannot_resize_habit_event' => 'You cannot resize a habit event',
			'calendar.event_detail.date' => 'Date',
			'calendar.event_detail.time' => 'Time',
			'calendar.event_detail.organizer' => 'Organizer',
			'calendar.event_detail.reminders' => 'Reminder',
			'calendar.event_detail.details' => 'Details',
			'calendar.event_detail.join_meeting' => 'Join meeting',
			'calendar.event_detail.google_meet_call' => 'Google Meet Call',
			'calendar.event_detail.zoom_meet_call' => 'Zoom Call',
			'calendar.event_detail.ms_teams_call' => 'MS Teams Call',
			'calendar.event_detail.join_now' => 'Join now',
			'calendar.event_detail.attendee' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'Attendee', one: 'Attendee', other: 'Attendees', ), 
			'calendar.settings.title' => 'Calendar Settings',
			'calendar.settings.display_habits' => 'Display habits',
			'habits.title' => 'Habits',
			'habits.no_habits' => 'No habits for now',
			'habits.get_started_now' => 'Add your first habit to get started!',
			'habits.delete_habit.title' => 'Delete habit',
			'habits.delete_habit.description' => 'Are you sure you want to delete this habit?',
			'habits.delete_habit.warning' => 'This action cannot be undone and all the related entries will also be deleted.',
			'habits.add.title' => 'What do you want to achieve?',
			'habits.add.name' => 'Habit name*',
			'habits.add.name_hint' => 'Drink water',
			'habits.add.name_description' => 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.',
			'habits.add.name_required' => 'Name is required',
			'habits.add.citation' => 'Citation',
			'habits.add.citation_description' => 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.',
			'habits.add.citation_hint' => '“Water is the only drink for a wise man.” — Henry David Thoreau',
			'habits.add.start_date' => 'Start date',
			'habits.add.end_date' => 'End date',
			'habits.add.when_would_you_like_the_habit_to_start' => 'When would you like the habit to start?',
			'habits.add.when_would_you_like_the_habit_to_end' => 'When would you like the habit to end?',
			'habits.add.no_date_selected' => 'No date selected',
			'habits.add.frequency_label' => 'Frequency',
			'habits.add.frequency.daily' => 'Daily',
			'habits.add.frequency.weekly' => 'Weekly',
			'habits.add.frequency.monthly' => 'Monthly',
			'habits.add.frequency.repeatition' => 'Repeatition',
			'habits.add.number_of_times_label' => 'Number of times',
			'habits.add.number_of_times_description' => 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).',
			'habits.add.days_of_week_label' => 'Days of the week',
			'habits.add.days_of_week_description' => 'On which days of the week do you want to do this habit?',
			'habits.add.search_emoji_hint' => 'Search for an emoji',
			'habits.add.reminders_label' => 'Reminders',
			'habits.add.reminders_description' => 'Set a time for your reminders. You will be notified when the time is reached.',
			'habits.add.reminders_add' => 'Add a reminder',
			'habits.add.duration_label' => 'Duration',
			'habits.add.duration_description' => 'How long do you want to do this habit?',
			'habits.add.duration_hint' => '5 minutes',
			'habits.add.days_of_week_mismatch' => 'You must select the same number of days as the number of times',
			'habits.add.every_number_day_title' => 'Repeatition in days',
			'habits.add.every_number_day_description' => 'How many days do you want to wait before repeating this habit?',
			'habits.add.days_of_month_title' => 'Days of the month',
			'habits.add.days_of_month_description' => 'On which days of the month do you want to do this habit?',
			'habits.add.select_days' => 'Select days',
			'habits.list' => 'Habits',
			'habits.overview' => 'Overview',
			'habits.times_a_day' => ({required Object nb}) => '${nb} times a day',
			'habits.times_a_week' => ({required Object nb}) => '${nb} times a week',
			'habits.times_a_month' => ({required Object nb}) => '${nb} times a month',
			'habits.habit_detail.no_citation' => 'No citation',
			'habits.habit_detail.no_end_date' => 'No end date',
			'habits.habit_detail.delete_habit' => 'Delete habit',
			'habits.habit_detail.delete_habit_description' => 'Are you sure you want to delete this habit?',
			'habits.habit_detail.delete_habit_warning' => 'This action cannot be undone and all the related entries will also be deleted.',
			'habits.habit_detail.entries' => 'Entries',
			'habits.habit_detail.no_entries' => 'No entries for now',
			'habits.habit_detail.delete_entry' => 'Delete entry',
			'habits.habit_detail.delete_entry_description' => 'Are you sure you want to delete this entry?',
			'habits.habit_detail.delete_entry_warning' => 'This action cannot be undone.',
			'under_construction.title' => 'We\'re working on it!',
			'under_construction.description' => 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!',
			'more.title' => 'More',
			'date_modes.date' => 'Date',
			'date_modes.duration' => 'Duration',
			'times.today' => 'Today',
			'times.tomorrow' => 'Tomorrow',
			'times.this_week' => 'This week',
			'times.minutes' => ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: '${nb} minutes', one: '${nb} minute', other: '${nb} minutes', ), 
			'days_of_week.monday' => 'Monday',
			'days_of_week.tuesday' => 'Tuesday',
			'days_of_week.wednesday' => 'Wednesday',
			'days_of_week.thursday' => 'Thursday',
			'days_of_week.friday' => 'Friday',
			'days_of_week.saturday' => 'Saturday',
			'days_of_week.sunday' => 'Sunday',
			'actions.save' => 'Save',
			'actions.cancel' => 'Cancel',
			'actions.delete' => 'Delete',
			'actions.add' => 'Add',
			'actions.edit' => 'Edit',
			'actions.clear' => 'Clear',
			'actions.close' => 'Close',
			'errors.wrong_email_password' => 'Email or password incorrect',
			'errors.email_malformed' => 'Email malformed',
			'errors.unknown_error' => 'Unknown error',
			'account.title' => 'Account',
			'notifications.task_due_now' => 'The task is due',
			'notifications.task_starting' => 'The task is starting',
			'notifications.task_starting_in' => ({required Object time}) => 'The task is starting in ${time}',
			'notifications.habit_due_now' => 'Perform the habit now, one less thing to do!',
			'time_units.short.day' => 'd',
			'time_units.short.hour' => 'h',
			'time_units.short.minute' => 'm',
			'time_units.long.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'days', one: 'day', other: 'days', ), 
			'time_units.long.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'hours', one: 'hour', other: 'hours', ), 
			'time_units.long.minute' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'minutes', one: 'minute', other: 'minutes', ), 
			'eisenhower.small_title' => 'Eisenhower',
			'eisenhower.title' => 'Eisenhower Matrix',
			'inbox.title' => 'Inbox',
			'timer.title' => 'Timer',
			'timer.start' => 'Start',
			'timer.stop' => 'Stop',
			'timer.pause' => 'Pause',
			'timer.duration' => 'Duration',
			'timer.start_pomodoro' => 'Start pomodoro',
			'timer.start_stopwatch' => 'Start stopwatch',
			'timer.pomo_running' => 'Pomodoro running',
			'timer.timer_running' => 'Timer running',
			'timer.time_left' => ({required Object timeLeft}) => 'Time left: ${timeLeft}',
			'timer.start_break' => 'Start break',
			'timer.elapsed_time' => 'Elapsed time',
			'timer.modes.pomodoro' => 'Pomodoro',
			'timer.modes.stopwatch' => 'Stopwatch',
			'timer.select_task' => 'Select a task',
			'timer.completed' => 'Completed!',
			'timer.pomodoro_completed_message' => 'Your pomodoro session has completed! Time for a break.',
			'timer.stopwatch_completed_message' => 'Your stopwatch session has been completed.',
			'timer.task_label' => 'Task',
			'search.title' => 'Search',
			'search.results' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No results found', one: '1 result found', other: '${n} results found', ), 
			'sync.title' => 'Synchronization',
			'sync.status' => 'Status',
			'sync.loading' => 'Loading...',
			'sync.up_to_date' => 'Up to date',
			'sync.conflicts' => 'Conflicts',
			'sync.x_items_have_conflicts' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No items have conflicts', one: '1 item has conflicts', other: '${n} items have conflicts', ), 
			'sync.details.title' => 'Details',
			'sync.details.tasks' => 'Tasks',
			'sync.details.task_items' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No tasks', one: '1 task', other: '${n} tasks', ), 
			'sync.sync_now' => 'Sync now',
			'sync.conflict_resolver.title' => 'Conflict Resolver',
			'sync.conflict_resolver.choose_between' => 'Choose between accepting or refusing the changes',
			'sync.conflict_resolver.refuse' => 'Refuse',
			'sync.conflict_resolver.accept' => 'Accept',
			'sync.conflict_resolver.in_app_version' => 'In-app',
			'sync.conflict_resolver.changes_to_apply' => 'Changes to apply',
			'sync.conflict_resolver.apply_to_all' => 'Apply decision to all conflicts',
			'sync.conflict_resolver.fields.title' => 'Title',
			'sync.conflict_resolver.fields.end_date' => 'End date',
			'sync.conflict_resolver.fields.description' => 'Notes',
			'sync.conflict_resolver.fields.start_date' => 'Start date',
			'sync.conflict_resolver.fields.reminders_title' => 'Reminders',
			'sync.conflict_resolver.fields.reminders' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No reminders', one: '1 reminder', other: '${n} reminders', ), 
			'sync.conflict_resolver.fields.undefined' => 'Undefined',
			'sync.conflict_resolver.fields.priority' => 'Priority',
			'sync.conflict_resolver.fields.folder' => 'Folder',
			'sync.conflict_resolver.fields.tags' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, zero: 'No tags', one: '1 tag', other: '${n} tags', ), 
			'sync.conflict_resolver.progress' => 'Progress',
			_ => null,
		};
	}
}
