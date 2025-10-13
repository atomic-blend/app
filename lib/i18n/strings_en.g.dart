///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
			case 'app_name_saas': return 'Atomic Blend Cloud';
			case 'settings.title': return 'Settings';
			case 'settings.app_settings.title': return 'App Settings';
			case 'settings.app_settings.selfHostedUrl.title': return 'Self-Hosted URL';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Not set';
			case 'settings.logout': return 'Logout';
			case 'tags.title': return 'Tags';
			case 'tags.assign_tags': return 'Assign tags';
			case 'tags.add_modal.title': return 'Add a new tag';
			case 'tags.add_modal.edit_title': return 'Edit tag';
			case 'tags.add_modal.name': return 'Name of the tag';
			case 'tags.add_modal.name_hint': return 'Work';
			case 'tags.add_modal.name_description': return 'Define a name for your tag, this will help you remember what it is about and be shown in notifications.';
			case 'tags.add_modal.name_required': return 'Name is required';
			case 'tags.add_modal.color': return 'Color';
			case 'tags.add_modal.color_description': return 'Choose a color for your tag, this will help you remember what it is about and be shown in notifications.';
			case 'tags.delete.title': return 'Delete tag';
			case 'tags.delete.description': return 'Are you sure you want to delete this tag?';
			case 'tags.delete.warning': return 'This action cannot be undone and the tag will be removed from all tags associated.';
			case 'tasks.title': return 'Tasks';
			case 'tasks.today': return 'Today';
			case 'tasks.overview': return 'Overview';
			case 'tasks.inbox': return 'Inbox';
			case 'tasks.tags': return 'Tags';
			case 'tasks.all_tasks': return 'All tasks';
			case 'tasks.completed_tasks': return 'Completed tasks';
			case 'tasks.my_tags': return 'My tags';
			case 'tasks.no_tags_for_now': return 'No tags for now';
			case 'tasks.my_folders': return 'My folders';
			case 'tasks.folders.title': return 'Folders';
			case 'tasks.folders.no_folders': return 'No folders for now';
			case 'tasks.folders.add_folder': return 'Add a folder';
			case 'tasks.folders.edit_folder': return 'Edit folder';
			case 'tasks.folders.delete_folder': return 'Delete folder';
			case 'tasks.folders.delete_folder_description': return 'Are you sure you want to delete this folder?';
			case 'tasks.folders.delete_folder_warning': return 'This action cannot be undone and all the tasks will be unlinked';
			case 'tasks.folders.name': return 'Name of the folder';
			case 'tasks.folders.name_hint': return 'Work';
			case 'tasks.folders.name_description': return 'Define a name for your folder, this will help you remember what it is about and be shown in notifications.';
			case 'tasks.folders.name_required': return 'Name is required';
			case 'tasks.folders.color': return 'Color';
			case 'tasks.folders.color_description': return 'Choose a color for your folder, this will help you remember what it is about and be shown in notifications.';
			case 'tasks.folders.select_a_folder': return 'Select a folder';
			case 'tasks.nothing_to_do': return 'Nothing to do for now, enjoy your day!';
			case 'tasks.day_off': return 'You have nothing planned for tomorrow, enjoy your day!';
			case 'tasks.no_tasks_for_now': return 'No tasks for now';
			case 'tasks.time_log': return 'Time Log';
			case 'tasks.log_session': return 'Log session';
			case 'tasks.timer': return 'Timer';
			case 'tasks.pomodoro': return 'Pomodoro';
			case 'tasks.manual': return 'Manual';
			case 'tasks.from': return 'From';
			case 'tasks.to': return 'To';
			case 'tasks.priority': return 'Priority';
			case 'tasks.priorities.none': return 'None';
			case 'tasks.priorities.low': return 'Low';
			case 'tasks.priorities.medium': return 'Medium';
			case 'tasks.priorities.high': return 'High';
			case 'tasks.due_dates.today': return 'Today';
			case 'tasks.due_dates.tomorrow': return 'Tomorrow';
			case 'tasks.due_dates.no_due_date': return 'No due date';
			case 'tasks.add_task_modal.task_title': return 'What do you need to do?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.dates': return 'Dates';
			case 'tasks.add_task_modal.notes': return 'Notes';
			case 'tasks.add_task_modal.start_date': return 'Start Date';
			case 'tasks.add_task_modal.end_date': return 'End Date';
			case 'tasks.add_task_modal.cancel': return 'Cancel';
			case 'tasks.add_task_modal.save': return 'Save';
			case 'tasks.add_task_modal.erase': return 'Erase';
			case 'tasks.add_task_modal.task_added': return 'Task added';
			case 'tasks.add_task_modal.task_added_description': return 'Your task has been added successfully.';
			case 'tasks.add_task_modal.task_error': return 'Task error';
			case 'tasks.add_task_modal.title_required': return 'Title required';
			case 'tasks.add_task_modal.title_required_description': return 'Please enter a title for your task';
			case 'tasks.add_task_modal.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Reminder',
				one: 'Reminder',
				other: 'Reminders',
			);
			case 'tasks.add_task_modal.time_planned': return 'Expected time';
			case 'tasks.add_task_modal.none': return 'None';
			case 'tasks.add_task_modal.no_reminders': return 'No reminders';
			case 'tasks.add_task_modal.when_would_you_like_to_be_reminded': return 'When would you like to be reminded?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_start': return 'When would you like the task to start?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_end': return 'When would you like the task to end?';
			case 'tasks.time_spent': return 'Time spent';
			case 'tasks.no_time_entries': return 'No time entries for now';
			case 'tasks.add_time_entry.title': return 'Add a time entry';
			case 'tasks.add_time_entry.description': return 'Manually add a time entry for this task.';
			case 'tasks.add_time_entry.start_time': return 'Start time';
			case 'tasks.add_time_entry.end_time': return 'End time';
			case 'tasks.add_time_entry.not_defined': return 'Not defined';
			case 'tasks.conflict_detected_modal.title': return 'Conflict Detected';
			case 'tasks.conflict_detected_modal.description': return 'Previous edits of this task made while offline conflicts with the current version of the task.';
			case 'tasks.conflict_detected_modal.warning': return 'You can either resolve the conflicts now or come back later to resolve them.';
			case 'tasks.conflict_detected_modal.resolve_now': return 'Resolve';
			case 'tasks.conflict_detected_modal.later': return 'Later';
			case 'calendar.title': return 'Calendar';
			case 'calendar.month': return 'Month';
			case 'calendar.day': return 'Day';
			case 'calendar.threeDays': return '3 Days';
			case 'calendar.week': return 'Week';
			case 'calendar.schedule': return 'Schedule';
			case 'calendar.errors.cannot_move_device_calendar_event': return 'You cannot move a device calendar event';
			case 'calendar.errors.cannot_move_habit_event': return 'You cannot move a habit event';
			case 'calendar.errors.cannot_resize_device_calendar_event': return 'You cannot resize a device calendar event';
			case 'calendar.errors.cannot_resize_habit_event': return 'You cannot resize a habit event';
			case 'calendar.event_detail.date': return 'Date';
			case 'calendar.event_detail.time': return 'Time';
			case 'calendar.event_detail.organizer': return 'Organizer';
			case 'calendar.event_detail.reminders': return 'Reminder';
			case 'calendar.event_detail.details': return 'Details';
			case 'calendar.event_detail.join_meeting': return 'Join meeting';
			case 'calendar.event_detail.google_meet_call': return 'Google Meet Call';
			case 'calendar.event_detail.zoom_meet_call': return 'Zoom Call';
			case 'calendar.event_detail.ms_teams_call': return 'MS Teams Call';
			case 'calendar.event_detail.join_now': return 'Join now';
			case 'calendar.event_detail.attendee': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'Attendee',
				one: 'Attendee',
				other: 'Attendees',
			);
			case 'calendar.settings.title': return 'Calendar Settings';
			case 'calendar.settings.display_habits': return 'Display habits';
			case 'habits.title': return 'Habits';
			case 'habits.no_habits': return 'No habits for now';
			case 'habits.get_started_now': return 'Add your first habit to get started!';
			case 'habits.delete_habit.title': return 'Delete habit';
			case 'habits.delete_habit.description': return 'Are you sure you want to delete this habit?';
			case 'habits.delete_habit.warning': return 'This action cannot be undone and all the related entries will also be deleted.';
			case 'habits.add.title': return 'What do you want to achieve?';
			case 'habits.add.name': return 'Habit name*';
			case 'habits.add.name_hint': return 'Drink water';
			case 'habits.add.name_description': return 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.';
			case 'habits.add.name_required': return 'Name is required';
			case 'habits.add.citation': return 'Citation';
			case 'habits.add.citation_description': return 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.';
			case 'habits.add.citation_hint': return '“Water is the only drink for a wise man.” — Henry David Thoreau';
			case 'habits.add.start_date': return 'Start date';
			case 'habits.add.end_date': return 'End date';
			case 'habits.add.when_would_you_like_the_habit_to_start': return 'When would you like the habit to start?';
			case 'habits.add.when_would_you_like_the_habit_to_end': return 'When would you like the habit to end?';
			case 'habits.add.no_date_selected': return 'No date selected';
			case 'habits.add.frequency_label': return 'Frequency';
			case 'habits.add.frequency.daily': return 'Daily';
			case 'habits.add.frequency.weekly': return 'Weekly';
			case 'habits.add.frequency.monthly': return 'Monthly';
			case 'habits.add.frequency.repeatition': return 'Repeatition';
			case 'habits.add.number_of_times_label': return 'Number of times';
			case 'habits.add.number_of_times_description': return 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).';
			case 'habits.add.days_of_week_label': return 'Days of the week';
			case 'habits.add.days_of_week_description': return 'On which days of the week do you want to do this habit?';
			case 'habits.add.search_emoji_hint': return 'Search for an emoji';
			case 'habits.add.reminders_label': return 'Reminders';
			case 'habits.add.reminders_description': return 'Set a time for your reminders. You will be notified when the time is reached.';
			case 'habits.add.reminders_add': return 'Add a reminder';
			case 'habits.add.duration_label': return 'Duration';
			case 'habits.add.duration_description': return 'How long do you want to do this habit?';
			case 'habits.add.duration_hint': return '5 minutes';
			case 'habits.add.days_of_week_mismatch': return 'You must select the same number of days as the number of times';
			case 'habits.add.every_number_day_title': return 'Repeatition in days';
			case 'habits.add.every_number_day_description': return 'How many days do you want to wait before repeating this habit?';
			case 'habits.add.days_of_month_title': return 'Days of the month';
			case 'habits.add.days_of_month_description': return 'On which days of the month do you want to do this habit?';
			case 'habits.add.select_days': return 'Select days';
			case 'habits.list': return 'Habits';
			case 'habits.overview': return 'Overview';
			case 'habits.times_a_day': return ({required Object nb}) => '${nb} times a day';
			case 'habits.times_a_week': return ({required Object nb}) => '${nb} times a week';
			case 'habits.times_a_month': return ({required Object nb}) => '${nb} times a month';
			case 'habits.habit_detail.no_citation': return 'No citation';
			case 'habits.habit_detail.no_end_date': return 'No end date';
			case 'habits.habit_detail.delete_habit': return 'Delete habit';
			case 'habits.habit_detail.delete_habit_description': return 'Are you sure you want to delete this habit?';
			case 'habits.habit_detail.delete_habit_warning': return 'This action cannot be undone and all the related entries will also be deleted.';
			case 'habits.habit_detail.entries': return 'Entries';
			case 'habits.habit_detail.no_entries': return 'No entries for now';
			case 'habits.habit_detail.delete_entry': return 'Delete entry';
			case 'habits.habit_detail.delete_entry_description': return 'Are you sure you want to delete this entry?';
			case 'habits.habit_detail.delete_entry_warning': return 'This action cannot be undone.';
			case 'under_construction.title': return 'We\'re working on it!';
			case 'under_construction.description': return 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
			case 'more.title': return 'More';
			case 'date_modes.date': return 'Date';
			case 'date_modes.duration': return 'Duration';
			case 'times.today': return 'Today';
			case 'times.tomorrow': return 'Tomorrow';
			case 'times.this_week': return 'This week';
			case 'times.minutes': return ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: '${nb} minutes',
				one: '${nb} minute',
				other: '${nb} minutes',
			);
			case 'days_of_week.monday': return 'Monday';
			case 'days_of_week.tuesday': return 'Tuesday';
			case 'days_of_week.wednesday': return 'Wednesday';
			case 'days_of_week.thursday': return 'Thursday';
			case 'days_of_week.friday': return 'Friday';
			case 'days_of_week.saturday': return 'Saturday';
			case 'days_of_week.sunday': return 'Sunday';
			case 'actions.save': return 'Save';
			case 'actions.cancel': return 'Cancel';
			case 'actions.delete': return 'Delete';
			case 'actions.add': return 'Add';
			case 'actions.edit': return 'Edit';
			case 'actions.clear': return 'Clear';
			case 'actions.close': return 'Close';
			case 'errors.wrong_email_password': return 'Email or password incorrect';
			case 'errors.email_malformed': return 'Email malformed';
			case 'errors.unknown_error': return 'Unknown error';
			case 'account.title': return 'Account';
			case 'notifications.task_due_now': return 'The task is due';
			case 'notifications.task_starting': return 'The task is starting';
			case 'notifications.task_starting_in': return ({required Object time}) => 'The task is starting in ${time}';
			case 'notifications.habit_due_now': return 'Perform the habit now, one less thing to do!';
			case 'time_units.short.day': return 'd';
			case 'time_units.short.hour': return 'h';
			case 'time_units.short.minute': return 'm';
			case 'time_units.long.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'days',
				one: 'day',
				other: 'days',
			);
			case 'time_units.long.hour': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'hours',
				one: 'hour',
				other: 'hours',
			);
			case 'time_units.long.minute': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'minutes',
				one: 'minute',
				other: 'minutes',
			);
			case 'eisenhower.small_title': return 'Eisenhower';
			case 'eisenhower.title': return 'Eisenhower Matrix';
			case 'inbox.title': return 'Inbox';
			case 'timer.title': return 'Timer';
			case 'timer.start': return 'Start';
			case 'timer.stop': return 'Stop';
			case 'timer.pause': return 'Pause';
			case 'timer.duration': return 'Duration';
			case 'timer.start_pomodoro': return 'Start pomodoro';
			case 'timer.start_stopwatch': return 'Start stopwatch';
			case 'timer.pomo_running': return 'Pomodoro running';
			case 'timer.timer_running': return 'Timer running';
			case 'timer.time_left': return ({required Object timeLeft}) => 'Time left: ${timeLeft}';
			case 'timer.start_break': return 'Start break';
			case 'timer.elapsed_time': return 'Elapsed time';
			case 'timer.modes.pomodoro': return 'Pomodoro';
			case 'timer.modes.stopwatch': return 'Stopwatch';
			case 'timer.select_task': return 'Select a task';
			case 'timer.completed': return 'Completed!';
			case 'timer.pomodoro_completed_message': return 'Your pomodoro session has completed! Time for a break.';
			case 'timer.stopwatch_completed_message': return 'Your stopwatch session has been completed.';
			case 'timer.task_label': return 'Task';
			case 'search.title': return 'Search';
			case 'search.results': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No results found',
				one: '1 result found',
				other: '${n} results found',
			);
			case 'sync.title': return 'Synchronization';
			case 'sync.status': return 'Status';
			case 'sync.loading': return 'Loading...';
			case 'sync.up_to_date': return 'Up to date';
			case 'sync.conflicts': return 'Conflicts';
			case 'sync.x_items_have_conflicts': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No items have conflicts',
				one: '1 item has conflicts',
				other: '${n} items have conflicts',
			);
			case 'sync.details.title': return 'Details';
			case 'sync.details.tasks': return 'Tasks';
			case 'sync.details.task_items': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No tasks',
				one: '1 task',
				other: '${n} tasks',
			);
			case 'sync.sync_now': return 'Sync now';
			case 'sync.conflict_resolver.title': return 'Conflict Resolver';
			case 'sync.conflict_resolver.choose_between': return 'Choose between accepting or refusing the changes';
			case 'sync.conflict_resolver.refuse': return 'Refuse';
			case 'sync.conflict_resolver.accept': return 'Accept';
			case 'sync.conflict_resolver.in_app_version': return 'In-app';
			case 'sync.conflict_resolver.changes_to_apply': return 'Changes to apply';
			case 'sync.conflict_resolver.apply_to_all': return 'Apply decision to all conflicts';
			case 'sync.conflict_resolver.fields.title': return 'Title';
			case 'sync.conflict_resolver.fields.end_date': return 'End date';
			case 'sync.conflict_resolver.fields.description': return 'Notes';
			case 'sync.conflict_resolver.fields.start_date': return 'Start date';
			case 'sync.conflict_resolver.fields.reminders_title': return 'Reminders';
			case 'sync.conflict_resolver.fields.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No reminders',
				one: '1 reminder',
				other: '${n} reminders',
			);
			case 'sync.conflict_resolver.fields.undefined': return 'Undefined';
			case 'sync.conflict_resolver.fields.priority': return 'Priority';
			case 'sync.conflict_resolver.fields.folder': return 'Folder';
			case 'sync.conflict_resolver.fields.tags': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				zero: 'No tags',
				one: '1 tag',
				other: '${n} tags',
			);
			case 'sync.conflict_resolver.progress': return 'Progress';
			default: return null;
		}
	}
}

