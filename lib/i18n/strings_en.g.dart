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
	String get app_name => 'Atomic Blend';
	String get app_name_saas => 'Atomic Blend Cloud';
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsTasksEn tasks = TranslationsTasksEn._(_root);
	late final TranslationsCalendarEn calendar = TranslationsCalendarEn._(_root);
	late final TranslationsAccountEn account = TranslationsAccountEn._(_root);
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
	Map<String, dynamic> get days_before => {
		'none': TranslationsDaysBeforeNoneEn._(_root),
		'same_day': TranslationsDaysBeforeSameDayEn._(_root),
		'one_day': TranslationsDaysBeforeOneDayEn._(_root),
		'two_days': TranslationsDaysBeforeTwoDaysEn._(_root),
		'three_days': TranslationsDaysBeforeThreeDaysEn._(_root),
		'one_week': TranslationsDaysBeforeOneWeekEn._(_root),
		'custom': TranslationsDaysBeforeCustomEn._(_root),
	};
	Map<String, dynamic> get time_before => {
		'same_time': TranslationsTimeBeforeSameTimeEn._(_root),
		'five_minutes': TranslationsTimeBeforeFiveMinutesEn._(_root),
		'fifteen_minutes': TranslationsTimeBeforeFifteenMinutesEn._(_root),
		'thirty_minutes': TranslationsTimeBeforeThirtyMinutesEn._(_root),
		'one_hour': TranslationsTimeBeforeOneHourEn._(_root),
		'two_hours': TranslationsTimeBeforeTwoHoursEn._(_root),
		'one_day': TranslationsTimeBeforeOneDayEn._(_root),
		'custom': TranslationsTimeBeforeCustomEn._(_root),
	};
	late final TranslationsLoadingEn loading = TranslationsLoadingEn._(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
	Map<String, String> get errors => {
		'wrong_email_password': 'Email or password incorrect',
		'email_malformed': 'Email malformed',
		'unknown_error': 'Unknown error',
	};
	late final TranslationsNotificationsEn notifications = TranslationsNotificationsEn._(_root);
	late final TranslationsTimeUnitsEn time_units = TranslationsTimeUnitsEn._(_root);
	late final TranslationsNameGeneratorEn name_generator = TranslationsNameGeneratorEn._(_root);
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get back => 'Back';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthNotLoggedInEn not_logged_in = TranslationsAuthNotLoggedInEn._(_root);
	late final TranslationsAuthLoginOrRegisterEn login_or_register = TranslationsAuthLoginOrRegisterEn._(_root);
	late final TranslationsAuthLoginEn login = TranslationsAuthLoginEn._(_root);
	late final TranslationsAuthRegisterEn register = TranslationsAuthRegisterEn._(_root);
	late final TranslationsAuthDeleteAccountEn delete_account = TranslationsAuthDeleteAccountEn._(_root);
	late final TranslationsAuthMnemonicKeyEn mnemonic_key = TranslationsAuthMnemonicKeyEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	late final TranslationsSettingsAppSettingsEn app_settings = TranslationsSettingsAppSettingsEn._(_root);
	String get logout => 'Logout';
}

// Path: tasks
class TranslationsTasksEn {
	TranslationsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Tasks';
	String get today => 'Today';
	String get overview => 'Overview';
	String get nothing_to_do => 'Nothing to do for now, enjoy your day!';
	String get day_off => 'You have nothing planned for tomorrow, enjoy your day!';
	String get week_off => 'You have nothing planned for this week, try and take the time to do the stuff left behind!';
	String get no_tasks_for_now => 'No tasks for now';
	String get task_details => 'Task Details';
	String get from => 'From';
	String get to => 'To';
	late final TranslationsTasksDueDatesEn due_dates = TranslationsTasksDueDatesEn._(_root);
	late final TranslationsTasksAddTaskModalEn add_task_modal = TranslationsTasksAddTaskModalEn._(_root);
}

// Path: calendar
class TranslationsCalendarEn {
	TranslationsCalendarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Calendar';
	String get month => 'Month';
	String get day => 'Day';
	String get threeDays => '3 Days';
	late final TranslationsCalendarEventDetailEn event_detail = TranslationsCalendarEventDetailEn._(_root);
	late final TranslationsCalendarSettingsEn settings = TranslationsCalendarSettingsEn._(_root);
}

// Path: account
class TranslationsAccountEn {
	TranslationsAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get edit_profile => 'Edit Profile';
	late final TranslationsAccountSectionsEn sections = TranslationsAccountSectionsEn._(_root);
	late final TranslationsAccountActionsEn actions = TranslationsAccountActionsEn._(_root);
}

// Path: habits
class TranslationsHabitsEn {
	TranslationsHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Habits';
	String get no_habits => 'No habits for now';
	String get get_started_now => 'Add your first habit to get started!';
	late final TranslationsHabitsAddEn add = TranslationsHabitsAddEn._(_root);
	String get list => 'Habits';
	String get overview => 'Overview';
	String times_a_day({required Object nb}) => '${nb} times a day';
	String times_a_week({required Object nb}) => '${nb} times a week';
	String times_a_month({required Object nb}) => '${nb} times a month';
	late final TranslationsHabitsHabitDetailEn habit_detail = TranslationsHabitsHabitDetailEn._(_root);
}

// Path: under_construction
class TranslationsUnderConstructionEn {
	TranslationsUnderConstructionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'We\'re working on it!';
	String get description => 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
}

// Path: more
class TranslationsMoreEn {
	TranslationsMoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'More';
}

// Path: times
class TranslationsTimesEn {
	TranslationsTimesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
	String get yesterday => 'Yesterday';
	String get this_week => 'This week';
	String get last_week => 'Last week';
	String get this_month => 'This month';
	String get last_month => 'Last month';
	String get this_year => 'This year';
	String get last_year => 'Last year';
	String get all_time => 'All time';
}

// Path: days_before.none
class TranslationsDaysBeforeNoneEn {
	TranslationsDaysBeforeNoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '0';
	String get label => 'None';
}

// Path: days_before.same_day
class TranslationsDaysBeforeSameDayEn {
	TranslationsDaysBeforeSameDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => 'same_day';
	String get label => 'Same day';
}

// Path: days_before.one_day
class TranslationsDaysBeforeOneDayEn {
	TranslationsDaysBeforeOneDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-1';
	String get label => '1 day before';
}

// Path: days_before.two_days
class TranslationsDaysBeforeTwoDaysEn {
	TranslationsDaysBeforeTwoDaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-2';
	String get label => '2 days before';
}

// Path: days_before.three_days
class TranslationsDaysBeforeThreeDaysEn {
	TranslationsDaysBeforeThreeDaysEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-3';
	String get label => '3 days before';
}

// Path: days_before.one_week
class TranslationsDaysBeforeOneWeekEn {
	TranslationsDaysBeforeOneWeekEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-7';
	String get label => '1 week before';
}

// Path: days_before.custom
class TranslationsDaysBeforeCustomEn {
	TranslationsDaysBeforeCustomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => 'null';
	String get label => 'Custom';
}

// Path: time_before.same_time
class TranslationsTimeBeforeSameTimeEn {
	TranslationsTimeBeforeSameTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '0';
	String get label => 'Same time';
}

// Path: time_before.five_minutes
class TranslationsTimeBeforeFiveMinutesEn {
	TranslationsTimeBeforeFiveMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-5';
	String get label => '5 minutes before';
}

// Path: time_before.fifteen_minutes
class TranslationsTimeBeforeFifteenMinutesEn {
	TranslationsTimeBeforeFifteenMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-15';
	String get label => '15 minutes before';
}

// Path: time_before.thirty_minutes
class TranslationsTimeBeforeThirtyMinutesEn {
	TranslationsTimeBeforeThirtyMinutesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-30';
	String get label => '30 minutes before';
}

// Path: time_before.one_hour
class TranslationsTimeBeforeOneHourEn {
	TranslationsTimeBeforeOneHourEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-60';
	String get label => '1 hour before';
}

// Path: time_before.two_hours
class TranslationsTimeBeforeTwoHoursEn {
	TranslationsTimeBeforeTwoHoursEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-120';
	String get label => '2 hours before';
}

// Path: time_before.one_day
class TranslationsTimeBeforeOneDayEn {
	TranslationsTimeBeforeOneDayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => '-1440';
	String get label => '1 day before';
}

// Path: time_before.custom
class TranslationsTimeBeforeCustomEn {
	TranslationsTimeBeforeCustomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get value => 'null';
	String get label => 'Custom';
}

// Path: loading
class TranslationsLoadingEn {
	TranslationsLoadingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get simple => 'Loading...';
}

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get next => 'Next';
	String get back => 'Back';
	String get delete => 'Delete';
	String get add => 'Add';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Required';
	String get invalid_url => 'invalid URL';
}

// Path: notifications
class TranslationsNotificationsEn {
	TranslationsNotificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get task_due_now => 'The task is due';
	String get task_starting => 'The task is starting';
	String task_starting_in({required Object time}) => 'The task is starting in ${time}';
}

// Path: time_units
class TranslationsTimeUnitsEn {
	TranslationsTimeUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTimeUnitsShortEn short = TranslationsTimeUnitsShortEn._(_root);
	late final TranslationsTimeUnitsLongEn long = TranslationsTimeUnitsLongEn._(_root);
}

// Path: name_generator
class TranslationsNameGeneratorEn {
	TranslationsNameGeneratorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<String> get animals => [
		'bat',
		'owl',
		'fox',
		'rabbit',
		'otter',
		'penguin',
		'panda',
		'squirrel',
		'koala',
		'tiger',
		'giraffe',
		'monkey',
		'raccoon',
		'zebra',
		'kangaroo',
		'parrot',
		'dolphin',
		'sloth',
		'wolf',
		'lion',
		'bear',
		'eagle',
		'elephant',
		'leopard',
		'cheetah',
		'hippo',
		'lemur',
		'frog',
		'chameleon',
		'lynx',
		'puffin',
		'seal',
		'falcon',
		'orca',
		'meerkat',
		'hedgehog',
		'weasel',
		'armadillo',
		'wombat',
		'platypus',
		'badger',
		'yak',
		'lizard',
		'beetle',
		'caterpillar',
		'jaguar',
		'buffalo',
		'stingray',
		'mole',
		'donkey',
		'toucan',
		'flamingo',
		'goat',
		'alpaca',
		'moose',
		'peacock',
		'rhino',
		'gecko',
		'turkey',
		'hamster',
		'otter',
		'gorilla',
		'walrus',
		'vulture',
		'stingray',
		'newt',
		'iguana',
		'porcupine',
		'python',
		'antelope',
		'gibbon',
		'boar',
		'crane',
		'emu',
		'pelican',
		'hyena',
		'heron',
		'lynx',
		'lamb',
		'tortoise',
		'shrimp',
		'lobster',
		'moth',
		'clam',
		'pufferfish',
		'starfish',
		'shrike',
		'robin',
		'quail',
		'koala',
		'snail',
		'slug',
		'owl',
		'viper',
		'duck',
		'swallow',
		'crab',
		'llama',
		'mongoose',
		'kitten',
	];
	List<String> get adjectives => [
		'happy',
		'brave',
		'cheerful',
		'jolly',
		'playful',
		'bright',
		'silly',
		'curious',
		'swift',
		'bold',
		'mighty',
		'clever',
		'sneaky',
		'gentle',
		'fuzzy',
		'quirky',
		'bouncy',
		'sparkly',
		'zippy',
		'chirpy',
		'glossy',
		'snappy',
		'shiny',
		'dreamy',
		'frisky',
		'sunny',
		'zany',
		'wild',
		'funky',
		'feisty',
		'snug',
		'crisp',
		'lively',
		'sassy',
		'witty',
		'spunky',
		'perky',
		'crafty',
		'jazzy',
		'dapper',
		'smiley',
		'lucky',
		'peppy',
		'peachy',
		'tidy',
		'chilly',
		'breezy',
		'giddy',
		'graceful',
		'plucky',
		'dizzy',
		'spry',
		'whimsical',
		'nimble',
		'chirpy',
		'jumpy',
		'quirky',
		'spicy',
		'perky',
		'speedy',
		'nifty',
		'wobbly',
		'crunchy',
		'cranky',
		'snazzy',
		'peppy',
		'bubbly',
		'splashy',
		'breezy',
		'bouncy',
		'twinkly',
		'gleeful',
		'squishy',
		'wacky',
		'zesty',
		'snappy',
		'jovial',
		'feathered',
		'prickly',
		'whizzy',
		'perky',
		'whiskery',
		'spotty',
		'stripy',
		'flicky',
		'chatty',
		'dandy',
		'wiggly',
		'giggly',
		'spiffy',
		'jumpy',
		'perky',
		'skippy',
		'fluffy',
		'chunky',
		'puffy',
		'loopy',
		'pinky',
		'spunky',
		'fancy',
	];
}

// Path: auth.not_logged_in
class TranslationsAuthNotLoggedInEn {
	TranslationsAuthNotLoggedInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get welcome => 'Welcome to Atomic Blend';
	String get description_start => 'Atomic Blend is the first';
	String get e2e_app => 'end-to-end encrypted app';
	String get description_middle => 'that combines all the tools you need to manage both work and personal life in one place.\n\nFrom task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays';
	String get description_middle_bold => 'secure and seamless.';
	String get description_end => 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.';
	String get time_to_set_things_up => 'Time to set things up!';
	String get set_up_start => 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup.\n\nEither way, your data is';
	String get set_up_middle => 'end-to-end encrypted';
	String get set_up_end => ', ensuring that only you have access to your encryption key —';
	String get set_up_end_bold => 'not us, not anyone else.';
	String get description => 'LifeOS is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.';
	String get e2ee => 'We use end-to-end encryption to protect your personal data. Your data is secure and accessible only by you.';
	String get get_started_now => 'Get started now';
	String get i_agree_to => 'I agree to the';
	String get terms_of_service => 'Terms of Service';
}

// Path: auth.login_or_register
class TranslationsAuthLoginOrRegisterEn {
	TranslationsAuthLoginOrRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Unlock the potential of your life';
	String get login_or_register => 'Log in or register';
	String get login => 'Log in';
	String get register => 'Register';
	String get or => 'or';
	String get connecting_to => 'Connecting to: ';
}

// Path: auth.login
class TranslationsAuthLoginEn {
	TranslationsAuthLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '👋 Welcome back!';
	String get description => 'Use you email and password to log back in and access your data.';
	String get email => 'Email';
	String get forgot_password => 'Forgot password';
	String get login => 'Log in';
	String get no_account => 'No account?';
	String get email_hint => 'Enter your email address';
}

// Path: auth.register
class TranslationsAuthRegisterEn {
	TranslationsAuthRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get email => 'What’s your email ?';
	String get email_description => 'Your email is used only for login and password recovery purposes.';
	String get we_never_sell => 'We will never sell your data to third parties.';
	String get email_hint => 'email@example.com';
	String get password => 'Choose a password';
	String get password_hint => 'SuperSecure123!';
	String get confirmation_hint => 'Confirm your password';
	String get password_mismatch => 'Passwords do not match';
	String get forgot_password => 'Forgot password';
	String get register => 'Register';
	String get no_account => 'No account?';
}

// Path: auth.delete_account
class TranslationsAuthDeleteAccountEn {
	TranslationsAuthDeleteAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete your account';
	String get description => 'Are you sure you want to delete your account?';
	String get cannot_be_undone => 'This action cannot be undone.';
}

// Path: auth.mnemonic_key
class TranslationsAuthMnemonicKeyEn {
	TranslationsAuthMnemonicKeyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Your recovery key';
	String get description_start => 'This is your recovery key.';
	String get description_mid => 'Write it down and keep it in a safe place.';
	String get description_end => 'You will need it to recover access to your data if you forget your password.';
	String get mnemonic_hint => 'Enter your recovery key';
	String get mnemonic_error => 'Invalid recovery key';
	String get copy_success => 'Recovery key copied to clipboard';
}

// Path: settings.app_settings
class TranslationsSettingsAppSettingsEn {
	TranslationsSettingsAppSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'App Settings';
	late final TranslationsSettingsAppSettingsSelfHostedUrlEn selfHostedUrl = TranslationsSettingsAppSettingsSelfHostedUrlEn._(_root);
}

// Path: tasks.due_dates
class TranslationsTasksDueDatesEn {
	TranslationsTasksDueDatesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
	String get no_due_date => 'No due date';
}

// Path: tasks.add_task_modal
class TranslationsTasksAddTaskModalEn {
	TranslationsTasksAddTaskModalEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get task_title => 'What do you need to do?';
	String get description => 'Description';
	String get due_date => 'Due Date';
	String get start_date => 'Start Date';
	String get end_date => 'End Date';
	String get cancel => 'Cancel';
	String get save => 'Save';
	String get erase => 'Erase';
	String get title_required => 'Title required';
	String get title_required_description => 'Please enter a title for your task';
	String reminders({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'Reminder',
		one: 'Reminder',
		other: 'Reminders',
	);
	String get time_planned => 'Expected time';
	String get none => 'None';
	String get no_reminders => 'No reminders';
	String get add_reminder => 'Add a Reminder';
	String get when_would_you_like_to_be_reminded => 'When would you like to be reminded?';
	String get when_would_you_like_the_task_to_start => 'When would you like the task to start?';
	String get when_would_you_like_the_task_to_end => 'When would you like the task to end?';
}

// Path: calendar.event_detail
class TranslationsCalendarEventDetailEn {
	TranslationsCalendarEventDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get date => 'Date';
	String get time => 'Time';
	String get organizer => 'Organizer';
	String get reminders => 'Reminder';
	String get no_reminders => 'No reminders';
	String get details => 'Details';
	String get join_meeting => 'Join meeting';
	String get google_meet_call => 'Google Meet Call';
	String get zoom_meet_call => 'Zoom Call';
	String get ms_teams_call => 'MS Teams Call';
	String get join_now => 'Join now';
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
	String get title => 'Calendar Settings';
	String get display_habits => 'Display habits';
}

// Path: account.sections
class TranslationsAccountSectionsEn {
	TranslationsAccountSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get account => 'Account';
}

// Path: account.actions
class TranslationsAccountActionsEn {
	TranslationsAccountActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get security => 'Security & Privacy';
	String get delete_account => 'Delete my Account';
}

// Path: habits.add
class TranslationsHabitsAddEn {
	TranslationsHabitsAddEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'What do you want to achieve?';
	String get name => 'Habit name*';
	String get name_hint => 'Drink water';
	String get name_description => 'Define a name for your habit, this will help you remember what it is about and be shown in notifications.';
	String get name_required => 'Name is required';
	String get citation => 'Citation';
	String get citation_description => 'Add a citation to your habit, this will help you remember why you are doing it and motivate you.';
	String get citation_hint => '“Water is the only drink for a wise man.” — Henry David Thoreau';
	String get start_date => 'Start date';
	String get end_date => 'End date';
	String get when_would_you_like_the_habit_to_start => 'When would you like the habit to start?';
	String get when_would_you_like_the_habit_to_end => 'When would you like the habit to end?';
	String get no_date_selected => 'No date selected';
	String get frequency_label => 'Frequency';
	Map<String, String> get frequency => {
		'daily': 'Daily',
		'weekly': 'Weekly',
		'monthly': 'Monthly',
		'repeatition': 'Repeatition',
	};
	String get number_of_times_label => 'Number of times';
	String get number_of_times_description => 'How many times do you want to do this habit?\nEach time the frequency is reached, it will be reseted (for example, if you set it to 3 times and a daily frequency, you will have to do it 3 times a day).';
	String get days_of_week_label => 'Days of the week';
	String get days_of_week_description => 'On which days of the week do you want to do this habit?';
	String get search_emoji_hint => 'Search for an emoji';
	String get reminders_label => 'Reminders';
	String get reminders_description => 'Set a time for your reminders. You will be notified when the time is reached.';
	String get reminders_add => 'Add a reminder';
	String get duration_label => 'Duration';
	String get duration_description => 'How long do you want to do this habit?';
	String get duration_hint => '5 minutes';
	String get name_too_short => 'The name of the habit should be at least 4 characters long';
	String get days_of_week_mismatch => 'You must select the same number of days as the number of times';
	String get every_number_day_title => 'Repeatition in days';
	String get every_number_day_description => 'How many days do you want to wait before repeating this habit?';
	String get days_of_month_title => 'Days of the month';
	String get days_of_month_description => 'On which days of the month do you want to do this habit?';
	String get select_days => 'Select days';
}

// Path: habits.habit_detail
class TranslationsHabitsHabitDetailEn {
	TranslationsHabitsHabitDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get no_citation => 'No citation';
	String get no_end_date => 'No end date';
	String get delete_habit => 'Delete habit';
	String get delete_habit_description => 'Are you sure you want to delete this habit?';
	String get delete_habit_warning => 'This action cannot be undone and all the related entries will also be deleted.';
	String get entries => 'Entries';
	String get no_entries => 'No entries for now';
}

// Path: time_units.short
class TranslationsTimeUnitsShortEn {
	TranslationsTimeUnitsShortEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get day => 'd';
	String get hour => 'h';
	String get minute => 'm';
}

// Path: time_units.long
class TranslationsTimeUnitsLongEn {
	TranslationsTimeUnitsLongEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'days',
		one: 'day',
		other: 'days',
	);
	String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'hours',
		one: 'hour',
		other: 'hours',
	);
	String minute({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		zero: 'minutes',
		one: 'minute',
		other: 'minutes',
	);
}

// Path: settings.app_settings.selfHostedUrl
class TranslationsSettingsAppSettingsSelfHostedUrlEn {
	TranslationsSettingsAppSettingsSelfHostedUrlEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Self-Hosted URL';
	String get description => 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';
	String get placeholder => 'Enter the URL of your instance';
	String get not_set => 'Not set';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
			case 'app_name_saas': return 'Atomic Blend Cloud';
			case 'navigation.back': return 'Back';
			case 'auth.not_logged_in.welcome': return 'Welcome to Atomic Blend';
			case 'auth.not_logged_in.description_start': return 'Atomic Blend is the first';
			case 'auth.not_logged_in.e2e_app': return 'end-to-end encrypted app';
			case 'auth.not_logged_in.description_middle': return 'that combines all the tools you need to manage both work and personal life in one place.\n\nFrom task management to note-taking, document writing, time tracking, movie tracking, food tracking, everything stays';
			case 'auth.not_logged_in.description_middle_bold': return 'secure and seamless.';
			case 'auth.not_logged_in.description_end': return 'No more juggling multiple apps—Atomic Blend brings it all together with privacy at its core, so you can focus on what truly matters.';
			case 'auth.not_logged_in.time_to_set_things_up': return 'Time to set things up!';
			case 'auth.not_logged_in.set_up_start': return 'To use Atomic Blend and sync your data across devices, you can choose between the cloud version or a self-hosted setup.\n\nEither way, your data is';
			case 'auth.not_logged_in.set_up_middle': return 'end-to-end encrypted';
			case 'auth.not_logged_in.set_up_end': return ', ensuring that only you have access to your encryption key —';
			case 'auth.not_logged_in.set_up_end_bold': return 'not us, not anyone else.';
			case 'auth.not_logged_in.description': return 'LifeOS is a personal life management application that helps you organize your life, achieve your goals, and improve your well-being.';
			case 'auth.not_logged_in.e2ee': return 'We use end-to-end encryption to protect your personal data. Your data is secure and accessible only by you.';
			case 'auth.not_logged_in.get_started_now': return 'Get started now';
			case 'auth.not_logged_in.i_agree_to': return 'I agree to the';
			case 'auth.not_logged_in.terms_of_service': return 'Terms of Service';
			case 'auth.login_or_register.title': return 'Unlock the potential of your life';
			case 'auth.login_or_register.login_or_register': return 'Log in or register';
			case 'auth.login_or_register.login': return 'Log in';
			case 'auth.login_or_register.register': return 'Register';
			case 'auth.login_or_register.or': return 'or';
			case 'auth.login_or_register.connecting_to': return 'Connecting to: ';
			case 'auth.login.title': return '👋 Welcome back!';
			case 'auth.login.description': return 'Use you email and password to log back in and access your data.';
			case 'auth.login.email': return 'Email';
			case 'auth.login.forgot_password': return 'Forgot password';
			case 'auth.login.login': return 'Log in';
			case 'auth.login.no_account': return 'No account?';
			case 'auth.login.email_hint': return 'Enter your email address';
			case 'auth.register.email': return 'What’s your email ?';
			case 'auth.register.email_description': return 'Your email is used only for login and password recovery purposes.';
			case 'auth.register.we_never_sell': return 'We will never sell your data to third parties.';
			case 'auth.register.email_hint': return 'email@example.com';
			case 'auth.register.password': return 'Choose a password';
			case 'auth.register.password_hint': return 'SuperSecure123!';
			case 'auth.register.confirmation_hint': return 'Confirm your password';
			case 'auth.register.password_mismatch': return 'Passwords do not match';
			case 'auth.register.forgot_password': return 'Forgot password';
			case 'auth.register.register': return 'Register';
			case 'auth.register.no_account': return 'No account?';
			case 'auth.delete_account.title': return 'Delete your account';
			case 'auth.delete_account.description': return 'Are you sure you want to delete your account?';
			case 'auth.delete_account.cannot_be_undone': return 'This action cannot be undone.';
			case 'auth.mnemonic_key.title': return 'Your recovery key';
			case 'auth.mnemonic_key.description_start': return 'This is your recovery key.';
			case 'auth.mnemonic_key.description_mid': return 'Write it down and keep it in a safe place.';
			case 'auth.mnemonic_key.description_end': return 'You will need it to recover access to your data if you forget your password.';
			case 'auth.mnemonic_key.mnemonic_hint': return 'Enter your recovery key';
			case 'auth.mnemonic_key.mnemonic_error': return 'Invalid recovery key';
			case 'auth.mnemonic_key.copy_success': return 'Recovery key copied to clipboard';
			case 'settings.title': return 'Settings';
			case 'settings.app_settings.title': return 'App Settings';
			case 'settings.app_settings.selfHostedUrl.title': return 'Self-Hosted URL';
			case 'settings.app_settings.selfHostedUrl.description': return 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';
			case 'settings.app_settings.selfHostedUrl.placeholder': return 'Enter the URL of your instance';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Not set';
			case 'settings.logout': return 'Logout';
			case 'tasks.title': return 'Tasks';
			case 'tasks.today': return 'Today';
			case 'tasks.overview': return 'Overview';
			case 'tasks.nothing_to_do': return 'Nothing to do for now, enjoy your day!';
			case 'tasks.day_off': return 'You have nothing planned for tomorrow, enjoy your day!';
			case 'tasks.week_off': return 'You have nothing planned for this week, try and take the time to do the stuff left behind!';
			case 'tasks.no_tasks_for_now': return 'No tasks for now';
			case 'tasks.task_details': return 'Task Details';
			case 'tasks.from': return 'From';
			case 'tasks.to': return 'To';
			case 'tasks.due_dates.today': return 'Today';
			case 'tasks.due_dates.tomorrow': return 'Tomorrow';
			case 'tasks.due_dates.no_due_date': return 'No due date';
			case 'tasks.add_task_modal.task_title': return 'What do you need to do?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.due_date': return 'Due Date';
			case 'tasks.add_task_modal.start_date': return 'Start Date';
			case 'tasks.add_task_modal.end_date': return 'End Date';
			case 'tasks.add_task_modal.cancel': return 'Cancel';
			case 'tasks.add_task_modal.save': return 'Save';
			case 'tasks.add_task_modal.erase': return 'Erase';
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
			case 'tasks.add_task_modal.add_reminder': return 'Add a Reminder';
			case 'tasks.add_task_modal.when_would_you_like_to_be_reminded': return 'When would you like to be reminded?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_start': return 'When would you like the task to start?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_end': return 'When would you like the task to end?';
			case 'calendar.title': return 'Calendar';
			case 'calendar.month': return 'Month';
			case 'calendar.day': return 'Day';
			case 'calendar.threeDays': return '3 Days';
			case 'calendar.event_detail.date': return 'Date';
			case 'calendar.event_detail.time': return 'Time';
			case 'calendar.event_detail.organizer': return 'Organizer';
			case 'calendar.event_detail.reminders': return 'Reminder';
			case 'calendar.event_detail.no_reminders': return 'No reminders';
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
			case 'account.edit_profile': return 'Edit Profile';
			case 'account.sections.account': return 'Account';
			case 'account.actions.security': return 'Security & Privacy';
			case 'account.actions.delete_account': return 'Delete my Account';
			case 'habits.title': return 'Habits';
			case 'habits.no_habits': return 'No habits for now';
			case 'habits.get_started_now': return 'Add your first habit to get started!';
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
			case 'habits.add.name_too_short': return 'The name of the habit should be at least 4 characters long';
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
			case 'under_construction.title': return 'We\'re working on it!';
			case 'under_construction.description': return 'This feature is not yet available, but we\'re working hard to bring it to you soon.\n\nStay tuned!';
			case 'more.title': return 'More';
			case 'date_modes.date': return 'Date';
			case 'date_modes.duration': return 'Duration';
			case 'times.today': return 'Today';
			case 'times.tomorrow': return 'Tomorrow';
			case 'times.yesterday': return 'Yesterday';
			case 'times.this_week': return 'This week';
			case 'times.last_week': return 'Last week';
			case 'times.this_month': return 'This month';
			case 'times.last_month': return 'Last month';
			case 'times.this_year': return 'This year';
			case 'times.last_year': return 'Last year';
			case 'times.all_time': return 'All time';
			case 'days_of_week.monday': return 'Monday';
			case 'days_of_week.tuesday': return 'Tuesday';
			case 'days_of_week.wednesday': return 'Wednesday';
			case 'days_of_week.thursday': return 'Thursday';
			case 'days_of_week.friday': return 'Friday';
			case 'days_of_week.saturday': return 'Saturday';
			case 'days_of_week.sunday': return 'Sunday';
			case 'days_before.none.value': return '0';
			case 'days_before.none.label': return 'None';
			case 'days_before.same_day.value': return 'same_day';
			case 'days_before.same_day.label': return 'Same day';
			case 'days_before.one_day.value': return '-1';
			case 'days_before.one_day.label': return '1 day before';
			case 'days_before.two_days.value': return '-2';
			case 'days_before.two_days.label': return '2 days before';
			case 'days_before.three_days.value': return '-3';
			case 'days_before.three_days.label': return '3 days before';
			case 'days_before.one_week.value': return '-7';
			case 'days_before.one_week.label': return '1 week before';
			case 'days_before.custom.value': return 'null';
			case 'days_before.custom.label': return 'Custom';
			case 'time_before.same_time.value': return '0';
			case 'time_before.same_time.label': return 'Same time';
			case 'time_before.five_minutes.value': return '-5';
			case 'time_before.five_minutes.label': return '5 minutes before';
			case 'time_before.fifteen_minutes.value': return '-15';
			case 'time_before.fifteen_minutes.label': return '15 minutes before';
			case 'time_before.thirty_minutes.value': return '-30';
			case 'time_before.thirty_minutes.label': return '30 minutes before';
			case 'time_before.one_hour.value': return '-60';
			case 'time_before.one_hour.label': return '1 hour before';
			case 'time_before.two_hours.value': return '-120';
			case 'time_before.two_hours.label': return '2 hours before';
			case 'time_before.one_day.value': return '-1440';
			case 'time_before.one_day.label': return '1 day before';
			case 'time_before.custom.value': return 'null';
			case 'time_before.custom.label': return 'Custom';
			case 'loading.simple': return 'Loading...';
			case 'actions.save': return 'Save';
			case 'actions.cancel': return 'Cancel';
			case 'actions.next': return 'Next';
			case 'actions.back': return 'Back';
			case 'actions.delete': return 'Delete';
			case 'actions.add': return 'Add';
			case 'validation.required': return 'Required';
			case 'validation.invalid_url': return 'invalid URL';
			case 'errors.wrong_email_password': return 'Email or password incorrect';
			case 'errors.email_malformed': return 'Email malformed';
			case 'errors.unknown_error': return 'Unknown error';
			case 'notifications.task_due_now': return 'The task is due';
			case 'notifications.task_starting': return 'The task is starting';
			case 'notifications.task_starting_in': return ({required Object time}) => 'The task is starting in ${time}';
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
			case 'name_generator.animals.0': return 'bat';
			case 'name_generator.animals.1': return 'owl';
			case 'name_generator.animals.2': return 'fox';
			case 'name_generator.animals.3': return 'rabbit';
			case 'name_generator.animals.4': return 'otter';
			case 'name_generator.animals.5': return 'penguin';
			case 'name_generator.animals.6': return 'panda';
			case 'name_generator.animals.7': return 'squirrel';
			case 'name_generator.animals.8': return 'koala';
			case 'name_generator.animals.9': return 'tiger';
			case 'name_generator.animals.10': return 'giraffe';
			case 'name_generator.animals.11': return 'monkey';
			case 'name_generator.animals.12': return 'raccoon';
			case 'name_generator.animals.13': return 'zebra';
			case 'name_generator.animals.14': return 'kangaroo';
			case 'name_generator.animals.15': return 'parrot';
			case 'name_generator.animals.16': return 'dolphin';
			case 'name_generator.animals.17': return 'sloth';
			case 'name_generator.animals.18': return 'wolf';
			case 'name_generator.animals.19': return 'lion';
			case 'name_generator.animals.20': return 'bear';
			case 'name_generator.animals.21': return 'eagle';
			case 'name_generator.animals.22': return 'elephant';
			case 'name_generator.animals.23': return 'leopard';
			case 'name_generator.animals.24': return 'cheetah';
			case 'name_generator.animals.25': return 'hippo';
			case 'name_generator.animals.26': return 'lemur';
			case 'name_generator.animals.27': return 'frog';
			case 'name_generator.animals.28': return 'chameleon';
			case 'name_generator.animals.29': return 'lynx';
			case 'name_generator.animals.30': return 'puffin';
			case 'name_generator.animals.31': return 'seal';
			case 'name_generator.animals.32': return 'falcon';
			case 'name_generator.animals.33': return 'orca';
			case 'name_generator.animals.34': return 'meerkat';
			case 'name_generator.animals.35': return 'hedgehog';
			case 'name_generator.animals.36': return 'weasel';
			case 'name_generator.animals.37': return 'armadillo';
			case 'name_generator.animals.38': return 'wombat';
			case 'name_generator.animals.39': return 'platypus';
			case 'name_generator.animals.40': return 'badger';
			case 'name_generator.animals.41': return 'yak';
			case 'name_generator.animals.42': return 'lizard';
			case 'name_generator.animals.43': return 'beetle';
			case 'name_generator.animals.44': return 'caterpillar';
			case 'name_generator.animals.45': return 'jaguar';
			case 'name_generator.animals.46': return 'buffalo';
			case 'name_generator.animals.47': return 'stingray';
			case 'name_generator.animals.48': return 'mole';
			case 'name_generator.animals.49': return 'donkey';
			case 'name_generator.animals.50': return 'toucan';
			case 'name_generator.animals.51': return 'flamingo';
			case 'name_generator.animals.52': return 'goat';
			case 'name_generator.animals.53': return 'alpaca';
			case 'name_generator.animals.54': return 'moose';
			case 'name_generator.animals.55': return 'peacock';
			case 'name_generator.animals.56': return 'rhino';
			case 'name_generator.animals.57': return 'gecko';
			case 'name_generator.animals.58': return 'turkey';
			case 'name_generator.animals.59': return 'hamster';
			case 'name_generator.animals.60': return 'otter';
			case 'name_generator.animals.61': return 'gorilla';
			case 'name_generator.animals.62': return 'walrus';
			case 'name_generator.animals.63': return 'vulture';
			case 'name_generator.animals.64': return 'stingray';
			case 'name_generator.animals.65': return 'newt';
			case 'name_generator.animals.66': return 'iguana';
			case 'name_generator.animals.67': return 'porcupine';
			case 'name_generator.animals.68': return 'python';
			case 'name_generator.animals.69': return 'antelope';
			case 'name_generator.animals.70': return 'gibbon';
			case 'name_generator.animals.71': return 'boar';
			case 'name_generator.animals.72': return 'crane';
			case 'name_generator.animals.73': return 'emu';
			case 'name_generator.animals.74': return 'pelican';
			case 'name_generator.animals.75': return 'hyena';
			case 'name_generator.animals.76': return 'heron';
			case 'name_generator.animals.77': return 'lynx';
			case 'name_generator.animals.78': return 'lamb';
			case 'name_generator.animals.79': return 'tortoise';
			case 'name_generator.animals.80': return 'shrimp';
			case 'name_generator.animals.81': return 'lobster';
			case 'name_generator.animals.82': return 'moth';
			case 'name_generator.animals.83': return 'clam';
			case 'name_generator.animals.84': return 'pufferfish';
			case 'name_generator.animals.85': return 'starfish';
			case 'name_generator.animals.86': return 'shrike';
			case 'name_generator.animals.87': return 'robin';
			case 'name_generator.animals.88': return 'quail';
			case 'name_generator.animals.89': return 'koala';
			case 'name_generator.animals.90': return 'snail';
			case 'name_generator.animals.91': return 'slug';
			case 'name_generator.animals.92': return 'owl';
			case 'name_generator.animals.93': return 'viper';
			case 'name_generator.animals.94': return 'duck';
			case 'name_generator.animals.95': return 'swallow';
			case 'name_generator.animals.96': return 'crab';
			case 'name_generator.animals.97': return 'llama';
			case 'name_generator.animals.98': return 'mongoose';
			case 'name_generator.animals.99': return 'kitten';
			case 'name_generator.adjectives.0': return 'happy';
			case 'name_generator.adjectives.1': return 'brave';
			case 'name_generator.adjectives.2': return 'cheerful';
			case 'name_generator.adjectives.3': return 'jolly';
			case 'name_generator.adjectives.4': return 'playful';
			case 'name_generator.adjectives.5': return 'bright';
			case 'name_generator.adjectives.6': return 'silly';
			case 'name_generator.adjectives.7': return 'curious';
			case 'name_generator.adjectives.8': return 'swift';
			case 'name_generator.adjectives.9': return 'bold';
			case 'name_generator.adjectives.10': return 'mighty';
			case 'name_generator.adjectives.11': return 'clever';
			case 'name_generator.adjectives.12': return 'sneaky';
			case 'name_generator.adjectives.13': return 'gentle';
			case 'name_generator.adjectives.14': return 'fuzzy';
			case 'name_generator.adjectives.15': return 'quirky';
			case 'name_generator.adjectives.16': return 'bouncy';
			case 'name_generator.adjectives.17': return 'sparkly';
			case 'name_generator.adjectives.18': return 'zippy';
			case 'name_generator.adjectives.19': return 'chirpy';
			case 'name_generator.adjectives.20': return 'glossy';
			case 'name_generator.adjectives.21': return 'snappy';
			case 'name_generator.adjectives.22': return 'shiny';
			case 'name_generator.adjectives.23': return 'dreamy';
			case 'name_generator.adjectives.24': return 'frisky';
			case 'name_generator.adjectives.25': return 'sunny';
			case 'name_generator.adjectives.26': return 'zany';
			case 'name_generator.adjectives.27': return 'wild';
			case 'name_generator.adjectives.28': return 'funky';
			case 'name_generator.adjectives.29': return 'feisty';
			case 'name_generator.adjectives.30': return 'snug';
			case 'name_generator.adjectives.31': return 'crisp';
			case 'name_generator.adjectives.32': return 'lively';
			case 'name_generator.adjectives.33': return 'sassy';
			case 'name_generator.adjectives.34': return 'witty';
			case 'name_generator.adjectives.35': return 'spunky';
			case 'name_generator.adjectives.36': return 'perky';
			case 'name_generator.adjectives.37': return 'crafty';
			case 'name_generator.adjectives.38': return 'jazzy';
			case 'name_generator.adjectives.39': return 'dapper';
			case 'name_generator.adjectives.40': return 'smiley';
			case 'name_generator.adjectives.41': return 'lucky';
			case 'name_generator.adjectives.42': return 'peppy';
			case 'name_generator.adjectives.43': return 'peachy';
			case 'name_generator.adjectives.44': return 'tidy';
			case 'name_generator.adjectives.45': return 'chilly';
			case 'name_generator.adjectives.46': return 'breezy';
			case 'name_generator.adjectives.47': return 'giddy';
			case 'name_generator.adjectives.48': return 'graceful';
			case 'name_generator.adjectives.49': return 'plucky';
			case 'name_generator.adjectives.50': return 'dizzy';
			case 'name_generator.adjectives.51': return 'spry';
			case 'name_generator.adjectives.52': return 'whimsical';
			case 'name_generator.adjectives.53': return 'nimble';
			case 'name_generator.adjectives.54': return 'chirpy';
			case 'name_generator.adjectives.55': return 'jumpy';
			case 'name_generator.adjectives.56': return 'quirky';
			case 'name_generator.adjectives.57': return 'spicy';
			case 'name_generator.adjectives.58': return 'perky';
			case 'name_generator.adjectives.59': return 'speedy';
			case 'name_generator.adjectives.60': return 'nifty';
			case 'name_generator.adjectives.61': return 'wobbly';
			case 'name_generator.adjectives.62': return 'crunchy';
			case 'name_generator.adjectives.63': return 'cranky';
			case 'name_generator.adjectives.64': return 'snazzy';
			case 'name_generator.adjectives.65': return 'peppy';
			case 'name_generator.adjectives.66': return 'bubbly';
			case 'name_generator.adjectives.67': return 'splashy';
			case 'name_generator.adjectives.68': return 'breezy';
			case 'name_generator.adjectives.69': return 'bouncy';
			case 'name_generator.adjectives.70': return 'twinkly';
			case 'name_generator.adjectives.71': return 'gleeful';
			case 'name_generator.adjectives.72': return 'squishy';
			case 'name_generator.adjectives.73': return 'wacky';
			case 'name_generator.adjectives.74': return 'zesty';
			case 'name_generator.adjectives.75': return 'snappy';
			case 'name_generator.adjectives.76': return 'jovial';
			case 'name_generator.adjectives.77': return 'feathered';
			case 'name_generator.adjectives.78': return 'prickly';
			case 'name_generator.adjectives.79': return 'whizzy';
			case 'name_generator.adjectives.80': return 'perky';
			case 'name_generator.adjectives.81': return 'whiskery';
			case 'name_generator.adjectives.82': return 'spotty';
			case 'name_generator.adjectives.83': return 'stripy';
			case 'name_generator.adjectives.84': return 'flicky';
			case 'name_generator.adjectives.85': return 'chatty';
			case 'name_generator.adjectives.86': return 'dandy';
			case 'name_generator.adjectives.87': return 'wiggly';
			case 'name_generator.adjectives.88': return 'giggly';
			case 'name_generator.adjectives.89': return 'spiffy';
			case 'name_generator.adjectives.90': return 'jumpy';
			case 'name_generator.adjectives.91': return 'perky';
			case 'name_generator.adjectives.92': return 'skippy';
			case 'name_generator.adjectives.93': return 'fluffy';
			case 'name_generator.adjectives.94': return 'chunky';
			case 'name_generator.adjectives.95': return 'puffy';
			case 'name_generator.adjectives.96': return 'loopy';
			case 'name_generator.adjectives.97': return 'pinky';
			case 'name_generator.adjectives.98': return 'spunky';
			case 'name_generator.adjectives.99': return 'fancy';
			default: return null;
		}
	}
}

