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
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	String get app_name => 'Atomic Blend';
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsTodayEn today = TranslationsTodayEn._(_root);
	late final TranslationsCalendarEn calendar = TranslationsCalendarEn._(_root);
	late final TranslationsHabitsEn habits = TranslationsHabitsEn._(_root);
	late final TranslationsTasksEn tasks = TranslationsTasksEn._(_root);
	late final TranslationsMoreEn more = TranslationsMoreEn._(_root);
	late final TranslationsTimesEn times = TranslationsTimesEn._(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
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

// Path: today
class TranslationsTodayEn {
	TranslationsTodayEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Today';
	String get nothing_to_do => 'Nothing to do for now, enjoy your day!';
	String get day_off => 'You have nothing planned for tomorrow, enjoy your day!';
	String get week_off => 'You have nothing planned for this week, try and take the time to do the stuff left behind!';
}

// Path: calendar
class TranslationsCalendarEn {
	TranslationsCalendarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Calendar';
}

// Path: habits
class TranslationsHabitsEn {
	TranslationsHabitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Habits';
}

// Path: tasks
class TranslationsTasksEn {
	TranslationsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Tasks';
	String get no_tasks_for_now => 'No tasks for now';
	String get task_details => 'Task Details';
	late final TranslationsTasksDueDatesEn due_dates = TranslationsTasksDueDatesEn._(_root);
	late final TranslationsTasksAddTaskModalEn add_task_modal = TranslationsTasksAddTaskModalEn._(_root);
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

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get next => 'Next';
	String get back => 'Back';
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Required';
	String get invalid_url => 'invalid URL';
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
	String get forgot_password => 'Forgot password';
	String get register => 'Register';
	String get no_account => 'No account?';
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
	String get cancel => 'Cancel';
	String get save => 'Save';
	String get erase => 'Erase';
	String get title_required => 'Title required';
	String get title_required_description => 'Please enter a title for your task';
}

// Path: settings.app_settings.selfHostedUrl
class TranslationsSettingsAppSettingsSelfHostedUrlEn {
	TranslationsSettingsAppSettingsSelfHostedUrlEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Self-Hosted URL';
	String get description => 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';
	String get placeholder => 'Enter the URL of your self-hosted instance';
	String get not_set => 'Not set';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
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
			case 'auth.register.forgot_password': return 'Forgot password';
			case 'auth.register.register': return 'Register';
			case 'auth.register.no_account': return 'No account?';
			case 'settings.title': return 'Settings';
			case 'settings.app_settings.title': return 'App Settings';
			case 'settings.app_settings.selfHostedUrl.title': return 'Self-Hosted URL';
			case 'settings.app_settings.selfHostedUrl.description': return 'If you are using a self-hosted instance of Atomic Blend, you can enter the URL here.';
			case 'settings.app_settings.selfHostedUrl.placeholder': return 'Enter the URL of your self-hosted instance';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Not set';
			case 'settings.logout': return 'Logout';
			case 'today.title': return 'Today';
			case 'today.nothing_to_do': return 'Nothing to do for now, enjoy your day!';
			case 'today.day_off': return 'You have nothing planned for tomorrow, enjoy your day!';
			case 'today.week_off': return 'You have nothing planned for this week, try and take the time to do the stuff left behind!';
			case 'calendar.title': return 'Calendar';
			case 'habits.title': return 'Habits';
			case 'tasks.title': return 'My Tasks';
			case 'tasks.no_tasks_for_now': return 'No tasks for now';
			case 'tasks.task_details': return 'Task Details';
			case 'tasks.due_dates.today': return 'Today';
			case 'tasks.due_dates.tomorrow': return 'Tomorrow';
			case 'tasks.due_dates.no_due_date': return 'No due date';
			case 'tasks.add_task_modal.task_title': return 'What do you need to do?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.due_date': return 'Due Date';
			case 'tasks.add_task_modal.cancel': return 'Cancel';
			case 'tasks.add_task_modal.save': return 'Save';
			case 'tasks.add_task_modal.erase': return 'Erase';
			case 'tasks.add_task_modal.title_required': return 'Title required';
			case 'tasks.add_task_modal.title_required_description': return 'Please enter a title for your task';
			case 'more.title': return 'More';
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
			case 'actions.save': return 'Save';
			case 'actions.cancel': return 'Cancel';
			case 'actions.next': return 'Next';
			case 'actions.back': return 'Back';
			case 'validation.required': return 'Required';
			case 'validation.invalid_url': return 'invalid URL';
			default: return null;
		}
	}
}

