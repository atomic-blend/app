///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override String get app_name => 'Atomic Blend';
	@override String get app_name_saas => 'Atomic Blend Cloud';
	@override late final _TranslationsNavigationFr navigation = _TranslationsNavigationFr._(_root);
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsTagsFr tags = _TranslationsTagsFr._(_root);
	@override late final _TranslationsTasksFr tasks = _TranslationsTasksFr._(_root);
	@override late final _TranslationsCalendarFr calendar = _TranslationsCalendarFr._(_root);
	@override late final _TranslationsAccountFr account = _TranslationsAccountFr._(_root);
	@override late final _TranslationsHabitsFr habits = _TranslationsHabitsFr._(_root);
	@override late final _TranslationsUnderConstructionFr under_construction = _TranslationsUnderConstructionFr._(_root);
	@override late final _TranslationsMoreFr more = _TranslationsMoreFr._(_root);
	@override Map<String, String> get days_of_week => {
		'monday': 'Lundi',
		'tuesday': 'Mardi',
		'wednesday': 'Mercredi',
		'thursday': 'Jeudi',
		'friday': 'Vendredi',
		'saturday': 'Samedi',
		'sunday': 'Dimanche',
	};
	@override late final _TranslationsTimesFr times = _TranslationsTimesFr._(_root);
	@override Map<String, dynamic> get days_before => {
		'none': _TranslationsDaysBeforeNoneFr._(_root),
		'same_day': _TranslationsDaysBeforeSameDayFr._(_root),
		'one_day': _TranslationsDaysBeforeOneDayFr._(_root),
		'two_days': _TranslationsDaysBeforeTwoDaysFr._(_root),
		'three_days': _TranslationsDaysBeforeThreeDaysFr._(_root),
		'one_week': _TranslationsDaysBeforeOneWeekFr._(_root),
		'custom': _TranslationsDaysBeforeCustomFr._(_root),
	};
	@override Map<String, dynamic> get time_before => {
		'same_time': _TranslationsTimeBeforeSameTimeFr._(_root),
		'five_minutes': _TranslationsTimeBeforeFiveMinutesFr._(_root),
		'fifteen_minutes': _TranslationsTimeBeforeFifteenMinutesFr._(_root),
		'thirty_minutes': _TranslationsTimeBeforeThirtyMinutesFr._(_root),
		'one_hour': _TranslationsTimeBeforeOneHourFr._(_root),
		'two_hours': _TranslationsTimeBeforeTwoHoursFr._(_root),
		'one_day': _TranslationsTimeBeforeOneDayFr._(_root),
		'custom': _TranslationsTimeBeforeCustomFr._(_root),
	};
	@override late final _TranslationsActionsFr actions = _TranslationsActionsFr._(_root);
	@override Map<String, String> get date_modes => {
		'date': 'Date',
		'duration': 'Durée',
	};
	@override late final _TranslationsLoadingFr loading = _TranslationsLoadingFr._(_root);
	@override late final _TranslationsValidationFr validation = _TranslationsValidationFr._(_root);
	@override Map<String, String> get errors => {
		'wrong_email_password': 'Adresse e-mail ou mot de passe incorrect',
		'email_malformed': 'Adresse e-mail invalide',
		'unknown_error': 'Une erreur inconnue s\'est produite',
	};
	@override late final _TranslationsNotificationsFr notifications = _TranslationsNotificationsFr._(_root);
	@override late final _TranslationsTimeUnitsFr time_units = _TranslationsTimeUnitsFr._(_root);
	@override late final _TranslationsNameGeneratorFr name_generator = _TranslationsNameGeneratorFr._(_root);
	@override late final _TranslationsEisenhowerFr eisenhower = _TranslationsEisenhowerFr._(_root);
	@override late final _TranslationsFeatureUnderConstructionFr feature_under_construction = _TranslationsFeatureUnderConstructionFr._(_root);
	@override late final _TranslationsInboxFr inbox = _TranslationsInboxFr._(_root);
	@override late final _TranslationsTimerFr timer = _TranslationsTimerFr._(_root);
	@override late final _TranslationsPaywallFr paywall = _TranslationsPaywallFr._(_root);
	@override late final _TranslationsSearchFr search = _TranslationsSearchFr._(_root);
}

// Path: navigation
class _TranslationsNavigationFr implements TranslationsNavigationEn {
	_TranslationsNavigationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get back => 'Retour';
}

// Path: auth
class _TranslationsAuthFr implements TranslationsAuthEn {
	_TranslationsAuthFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthNotLoggedInFr not_logged_in = _TranslationsAuthNotLoggedInFr._(_root);
	@override late final _TranslationsAuthLoginOrRegisterFr login_or_register = _TranslationsAuthLoginOrRegisterFr._(_root);
	@override late final _TranslationsAuthLoginFr login = _TranslationsAuthLoginFr._(_root);
	@override late final _TranslationsAuthRegisterFr register = _TranslationsAuthRegisterFr._(_root);
	@override late final _TranslationsAuthDeleteAccountFr delete_account = _TranslationsAuthDeleteAccountFr._(_root);
	@override late final _TranslationsAuthMnemonicKeyFr mnemonic_key = _TranslationsAuthMnemonicKeyFr._(_root);
	@override late final _TranslationsAuthResetPasswordFr reset_password = _TranslationsAuthResetPasswordFr._(_root);
}

// Path: settings
class _TranslationsSettingsFr implements TranslationsSettingsEn {
	_TranslationsSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override late final _TranslationsSettingsAppSettingsFr app_settings = _TranslationsSettingsAppSettingsFr._(_root);
	@override String get logout => 'Déconnexion';
}

// Path: tags
class _TranslationsTagsFr implements TranslationsTagsEn {
	_TranslationsTagsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tags';
	@override String get no_tags => 'Aucun tag';
	@override String get assign_tags => 'Assigner des tags';
	@override late final _TranslationsTagsAddModalFr add_modal = _TranslationsTagsAddModalFr._(_root);
	@override late final _TranslationsTagsDeleteFr delete = _TranslationsTagsDeleteFr._(_root);
}

// Path: tasks
class _TranslationsTasksFr implements TranslationsTasksEn {
	_TranslationsTasksFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tâches';
	@override String get today => 'Aujourd\'hui';
	@override String get tags => 'Tags';
	@override String get inbox => 'Boîte de réception';
	@override String get all_tasks => 'Toutes les tâches';
	@override String get completed_tasks => 'Tâches terminées';
	@override String get my_tags => 'Mes tags';
	@override String get no_tags_for_now => 'Pas de tags pour le moment';
	@override String get my_folders => 'Mes dossiers';
	@override late final _TranslationsTasksFoldersFr folders = _TranslationsTasksFoldersFr._(_root);
	@override String get overview => 'Vue d\'ensemble';
	@override String get nothing_to_do => 'Rien à faire pour le moment, vous pouvez vous détendre !';
	@override String get day_off => 'Vous n\'avez rien de prévu pour demain, profitez-en !';
	@override String get week_off => 'Vous n\'avez rien de prévu pour cette semaine, essayez de prendre le temps de faire les choses laissées de côté !';
	@override String get no_tasks_for_now => 'Pas de tâches pour le moment';
	@override String get task_details => 'Détail de la tâche';
	@override String get time_log => 'Journal';
	@override String get log_session => 'Journaliser une session';
	@override String get timer => 'Chronomètre';
	@override String get pomodoro => 'Pomodoro';
	@override String get manual => 'Manuel';
	@override String get from => 'De';
	@override String get to => 'À';
	@override String get priority => 'Priorité';
	@override Map<String, String> get priorities => {
		'none': 'Aucune',
		'low': 'Faible',
		'medium': 'Moyenne',
		'high': 'Haute',
	};
	@override late final _TranslationsTasksDueDatesFr due_dates = _TranslationsTasksDueDatesFr._(_root);
	@override late final _TranslationsTasksAddTaskModalFr add_task_modal = _TranslationsTasksAddTaskModalFr._(_root);
	@override String get time_spent => 'Temps passé';
	@override String get no_time_entries => 'Pas d\'entrées de temps';
	@override late final _TranslationsTasksAddTimeEntryFr add_time_entry = _TranslationsTasksAddTimeEntryFr._(_root);
}

// Path: calendar
class _TranslationsCalendarFr implements TranslationsCalendarEn {
	_TranslationsCalendarFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calendrier';
	@override String get month => 'Mois';
	@override String get day => 'Jour';
	@override String get threeDays => '3 jours';
	@override String get week => 'Semaine';
	@override String get schedule => 'Emploi du temps';
	@override late final _TranslationsCalendarErrorsFr errors = _TranslationsCalendarErrorsFr._(_root);
	@override late final _TranslationsCalendarEventDetailFr event_detail = _TranslationsCalendarEventDetailFr._(_root);
	@override late final _TranslationsCalendarSettingsFr settings = _TranslationsCalendarSettingsFr._(_root);
}

// Path: account
class _TranslationsAccountFr implements TranslationsAccountEn {
	_TranslationsAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get edit_profile => 'Modifier le profil';
	@override late final _TranslationsAccountSectionsFr sections = _TranslationsAccountSectionsFr._(_root);
	@override late final _TranslationsAccountActionsFr actions = _TranslationsAccountActionsFr._(_root);
	@override late final _TranslationsAccountSubscriptionPaymentsFr subscription_payments = _TranslationsAccountSubscriptionPaymentsFr._(_root);
	@override late final _TranslationsAccountProfileFr profile = _TranslationsAccountProfileFr._(_root);
	@override late final _TranslationsAccountSecurityAndPrivacyFr security_and_privacy = _TranslationsAccountSecurityAndPrivacyFr._(_root);
}

// Path: habits
class _TranslationsHabitsFr implements TranslationsHabitsEn {
	_TranslationsHabitsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Habitudes';
	@override String get no_habits => 'Aucune habitude';
	@override String get get_started_now => 'Ajoutez votre première habitude pour commencer !';
	@override late final _TranslationsHabitsDeleteHabitFr delete_habit = _TranslationsHabitsDeleteHabitFr._(_root);
	@override late final _TranslationsHabitsAddFr add = _TranslationsHabitsAddFr._(_root);
	@override String get list => 'Habitudes';
	@override String get overview => 'Vue d\'ensemble';
	@override String times_a_day({required Object nb}) => '${nb} fois par jour';
	@override String times_a_week({required Object nb}) => '${nb} fois par semaine';
	@override String times_a_month({required Object nb}) => '${nb} fois par mois';
	@override late final _TranslationsHabitsHabitDetailFr habit_detail = _TranslationsHabitsHabitDetailFr._(_root);
}

// Path: under_construction
class _TranslationsUnderConstructionFr implements TranslationsUnderConstructionEn {
	_TranslationsUnderConstructionFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'On travaille dessus !';
	@override String get description => 'Cette fonctionnalité est en cours de développement.\n\nRevenez bientôt pour découvrir les dernières mises à jour !';
}

// Path: more
class _TranslationsMoreFr implements TranslationsMoreEn {
	_TranslationsMoreFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Plus';
}

// Path: times
class _TranslationsTimesFr implements TranslationsTimesEn {
	_TranslationsTimesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get tomorrow => 'Demain';
	@override String get yesterday => 'Hier';
	@override String get this_week => 'Cette semaine';
	@override String get last_week => 'La semaine dernière';
	@override String get this_month => 'Ce mois-ci';
	@override String get last_month => 'Le mois dernier';
	@override String get this_year => 'Cette année';
	@override String get last_year => 'L\'année dernière';
	@override String get all_time => 'Tout le temps';
	@override String minutes({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: '${nb} minutes',
		one: '${nb} minute',
		other: '${nb} minutes',
	);
}

// Path: days_before.none
class _TranslationsDaysBeforeNoneFr implements TranslationsDaysBeforeNoneEn {
	_TranslationsDaysBeforeNoneFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '0';
	@override String get label => 'Aucun';
}

// Path: days_before.same_day
class _TranslationsDaysBeforeSameDayFr implements TranslationsDaysBeforeSameDayEn {
	_TranslationsDaysBeforeSameDayFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '0';
	@override String get label => 'Le même jour';
}

// Path: days_before.one_day
class _TranslationsDaysBeforeOneDayFr implements TranslationsDaysBeforeOneDayEn {
	_TranslationsDaysBeforeOneDayFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-1';
	@override String get label => '1 jour avant';
}

// Path: days_before.two_days
class _TranslationsDaysBeforeTwoDaysFr implements TranslationsDaysBeforeTwoDaysEn {
	_TranslationsDaysBeforeTwoDaysFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-2';
	@override String get label => '2 jours avant';
}

// Path: days_before.three_days
class _TranslationsDaysBeforeThreeDaysFr implements TranslationsDaysBeforeThreeDaysEn {
	_TranslationsDaysBeforeThreeDaysFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-3';
	@override String get label => '3 jours avant';
}

// Path: days_before.one_week
class _TranslationsDaysBeforeOneWeekFr implements TranslationsDaysBeforeOneWeekEn {
	_TranslationsDaysBeforeOneWeekFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-7';
	@override String get label => '1 semaine avant';
}

// Path: days_before.custom
class _TranslationsDaysBeforeCustomFr implements TranslationsDaysBeforeCustomEn {
	_TranslationsDaysBeforeCustomFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => 'null';
	@override String get label => 'Personnalisé';
}

// Path: time_before.same_time
class _TranslationsTimeBeforeSameTimeFr implements TranslationsTimeBeforeSameTimeEn {
	_TranslationsTimeBeforeSameTimeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '0';
	@override String get label => 'Au même moment';
}

// Path: time_before.five_minutes
class _TranslationsTimeBeforeFiveMinutesFr implements TranslationsTimeBeforeFiveMinutesEn {
	_TranslationsTimeBeforeFiveMinutesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-5';
	@override String get label => '5 minutes avant';
}

// Path: time_before.fifteen_minutes
class _TranslationsTimeBeforeFifteenMinutesFr implements TranslationsTimeBeforeFifteenMinutesEn {
	_TranslationsTimeBeforeFifteenMinutesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-15';
	@override String get label => '15 minutes avant';
}

// Path: time_before.thirty_minutes
class _TranslationsTimeBeforeThirtyMinutesFr implements TranslationsTimeBeforeThirtyMinutesEn {
	_TranslationsTimeBeforeThirtyMinutesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-30';
	@override String get label => '30 minutes avant';
}

// Path: time_before.one_hour
class _TranslationsTimeBeforeOneHourFr implements TranslationsTimeBeforeOneHourEn {
	_TranslationsTimeBeforeOneHourFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-60';
	@override String get label => '1 heure avant';
}

// Path: time_before.two_hours
class _TranslationsTimeBeforeTwoHoursFr implements TranslationsTimeBeforeTwoHoursEn {
	_TranslationsTimeBeforeTwoHoursFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-120';
	@override String get label => '2 heures avant';
}

// Path: time_before.one_day
class _TranslationsTimeBeforeOneDayFr implements TranslationsTimeBeforeOneDayEn {
	_TranslationsTimeBeforeOneDayFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => '-1440';
	@override String get label => '1 jour avant';
}

// Path: time_before.custom
class _TranslationsTimeBeforeCustomFr implements TranslationsTimeBeforeCustomEn {
	_TranslationsTimeBeforeCustomFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get value => 'null';
	@override String get label => 'Personnalisé';
}

// Path: actions
class _TranslationsActionsFr implements TranslationsActionsEn {
	_TranslationsActionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Enregistrer';
	@override String get cancel => 'Annuler';
	@override String get next => 'Suivant';
	@override String get back => 'Retour';
	@override String get delete => 'Supprimer';
	@override String get add => 'Ajouter';
	@override String get edit => 'Modifier';
	@override String get clear => 'Effacer';
	@override String get close => 'Fermer';
	@override String get subscribe => 'S\'abonner';
}

// Path: loading
class _TranslationsLoadingFr implements TranslationsLoadingEn {
	_TranslationsLoadingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get simple => 'Chargement en cours...';
}

// Path: validation
class _TranslationsValidationFr implements TranslationsValidationEn {
	_TranslationsValidationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Ce champ est obligatoire';
	@override String get invalid_url => 'URL invalide';
}

// Path: notifications
class _TranslationsNotificationsFr implements TranslationsNotificationsEn {
	_TranslationsNotificationsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get task_due_now => 'La tâche est due maintenant';
	@override String get task_starting => 'La tâche commence maintenant';
	@override String task_starting_in({required Object time}) => 'La tâche commence dans ${time}';
	@override String get habit_due_now => 'Effectuez votre habitude maintenant, une chose en moins à faire !';
}

// Path: time_units
class _TranslationsTimeUnitsFr implements TranslationsTimeUnitsEn {
	_TranslationsTimeUnitsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTimeUnitsShortFr short = _TranslationsTimeUnitsShortFr._(_root);
	@override late final _TranslationsTimeUnitsLongFr long = _TranslationsTimeUnitsLongFr._(_root);
}

// Path: name_generator
class _TranslationsNameGeneratorFr implements TranslationsNameGeneratorEn {
	_TranslationsNameGeneratorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override List<String> get animals => [
		'hibou',
		'renard',
		'lapin',
		'loutre',
		'pingouin',
		'panda',
		'écureuil',
		'koala',
		'tigre',
		'girafe',
		'singe',
		'raton-laveur',
		'zèbre',
		'kangourou',
		'perroquet',
		'dauphin',
		'paresseux',
		'loup',
		'lion',
		'ours',
		'aigle',
		'éléphant',
		'léopard',
		'guépard',
		'hippopotame',
		'lemurien',
		'grenouille',
		'caméléon',
		'lynx',
		'macareux',
		'phoque',
		'faucon',
		'orque',
		'suricate',
		'hérisson',
		'belette',
		'tatou',
		'wombat',
		'ornithorynque',
		'blaireau',
		'yak',
		'lézard',
		'scarabée',
		'chenille',
		'jaguar',
		'buffle',
		'raie',
		'taupe',
		'âne',
		'toucan',
		'flamant',
		'chèvre',
		'alpaga',
		'orignal',
		'paon',
		'rhinocéros',
		'gecko',
		'dinde',
		'hamster',
		'loutre',
		'gorille',
		'morse',
		'vautour',
		'raie',
		'triton',
		'iguane',
		'porc-épic',
		'python',
		'antilope',
		'gibbon',
		'sanglier',
		'grue',
		'émeu',
		'pélican',
		'hyène',
		'héron',
		'agneau',
		'tortue',
		'crevette',
		'homard',
		'papillon de nuit',
		'palourde',
		'poisson-globe',
		'étoile de mer',
		'pie-grièche',
		'rouge-gorge',
		'caille',
		'koala',
		'escargot',
		'limace',
		'hibou',
		'vipère',
		'canard',
		'hirondelle',
		'crabe',
		'lama',
		'mangouste',
		'chaton',
	];
	@override List<String> get adjectives => [
		'joyeux',
		'courageux',
		'rigolo',
		'jovial',
		'espiègle',
		'brillant',
		'farfelu',
		'curieux',
		'rapide',
		'audacieux',
		'puissant',
		'malin',
		'rusé',
		'doux',
		'pelucheux',
		'excentrique',
		'rebondissant',
		'étincelant',
		'vif',
		'chantant',
		'lustré',
		'claquant',
		'brillant',
		'rêveur',
		'frétillant',
		'ensoleillé',
		'dingue',
		'sauvage',
		'funky',
		'intrépide',
		'confortable',
		'croquant',
		'vivant',
		'coquin',
		'spirituel',
		'dynamique',
		'pétillant',
		'astucieux',
		'élégant',
		'souriant',
		'chanceux',
		'plein d\'énergie',
		'chouette',
		'soigné',
		'frisquet',
		'venté',
		'gai',
		'gracieux',
		'courageux',
		'étourdi',
		'agile',
		'fantasque',
		'habile',
		'chanteur',
		'sautillant',
		'bizarre',
		'épicé',
		'énergique',
		'rapide',
		'pratique',
		'vacillant',
		'croustillant',
		'grognon',
		'chic',
		'plein d\'entrain',
		'bouillonnant',
		'éclaboussant',
		'venté',
		'rebondissant',
		'étincelant',
		'joyeux',
		'moelleux',
		'loufoque',
		'vivifiant',
		'claquant',
		'joyeux',
		'plumé',
		'piquant',
		'rapide',
		'vif',
		'moustachu',
		'tacheté',
		'rayé',
		'fougueux',
		'bavard',
		'distingué',
		'serpentin',
		'rigolo',
		'élégant',
		'sautillant',
		'dynamique',
		'skippy',
		'duveteux',
		'rondelet',
		'gonflé',
		'déjanté',
		'rose',
		'exubérant',
		'raffiné',
	];
}

// Path: eisenhower
class _TranslationsEisenhowerFr implements TranslationsEisenhowerEn {
	_TranslationsEisenhowerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get small_title => 'Eisenhower';
	@override String get title => 'Matrice d\'Eisenhower';
}

// Path: feature_under_construction
class _TranslationsFeatureUnderConstructionFr implements TranslationsFeatureUnderConstructionEn {
	_TranslationsFeatureUnderConstructionFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fonctionnalité en construction';
	@override String get description => 'Cette fonctionnalité n\'est pas encore disponible, mais nous travaillons dur pour vous l\'apporter bientôt.\n\nRestez à l\'écoute !';
}

// Path: inbox
class _TranslationsInboxFr implements TranslationsInboxEn {
	_TranslationsInboxFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Boîte de réception';
}

// Path: timer
class _TranslationsTimerFr implements TranslationsTimerEn {
	_TranslationsTimerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Minuteur';
	@override String get start => 'Démarrer';
	@override String get stop => 'Arrêter';
	@override String get reset => 'Réinitialiser';
	@override String get start_pomodoro => 'Démarrer Pomodoro';
	@override String get start_stopwatch => 'Démarrer Chronomètre';
	@override String get start_break => 'Démarrer une pause';
	@override String get pomo_running => 'Pomodoro en cours';
	@override String get timer_running => 'Timer en cours';
	@override String time_left({required Object timeLeft}) => 'Temps restant : ${timeLeft}';
	@override String get pause => 'Pause';
	@override String get resume => 'Reprendre';
	@override String get duration => 'Durée';
	@override String get elapsed_time => 'Temps écoulé';
	@override String get remaining_time => 'Temps restant';
	@override String get no_timer_running => 'Aucun minuteur en cours';
	@override Map<String, String> get modes => {
		'pomodoro': 'Pomodoro',
		'stopwatch': 'Chronomètre',
	};
	@override String get select_task => 'Sélectionner une tâche';
	@override String get select_task_to_start_timer => 'Sélectionner une tâche pour démarrer le minuteur';
	@override String get completed => 'Terminé !';
	@override String get pomodoro_completed_message => 'Votre session pomodoro est terminée ! C\'est l\'heure de faire une pause.';
	@override String get stopwatch_completed_message => 'Votre session de chronomètre a été terminée.';
	@override String get task_label => 'Tâche';
}

// Path: paywall
class _TranslationsPaywallFr implements TranslationsPaywallEn {
	_TranslationsPaywallFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Obtenez AtomicBlend Cloud';
	@override String get subtitle => 'Profitez d\'Atomic Blend sans restrictions et aidez l\'initiative open source.';
	@override late final _TranslationsPaywallAdvantagesFr advantages = _TranslationsPaywallAdvantagesFr._(_root);
	@override Map<String, dynamic> get pricing => {
		'\$rc_annual': _TranslationsPaywallPricing$rcAnnualFr._(_root),
		'\$rc_monthly': _TranslationsPaywallPricing$rcMonthlyFr._(_root),
	};
	@override String get no_package_selected => 'Aucun package sélectionné';
	@override String get purchase_failed => 'Échec de l\'achat';
	@override String get restore_purchase => 'Restaurer l\'achat';
	@override String get terms => 'Conditions d\'utilisation';
	@override String get privacy_policy => 'Politique de confidentialité';
	@override String get success => 'Achat réussi !';
	@override String get payment_in_progress => 'Paiement en cours';
	@override String get payment_in_progress_description => 'Veuillez patienter pendant que nous traitons votre paiement.';
	@override String get validation_failed => 'Échec de la validation';
	@override String get validation_failed_description => 'Veuillez vérifier votre connexion Internet et redémarrer l\'application.';
	@override String get mobile_app_required => 'Application mobile requise';
	@override String get payment_on_mobile_for_better_xp => 'Pour vous offrir la meilleure expérience possible, le paiement et la configuration du compte ne sont disponibles que sur l\'application mobile.';
	@override String get ios => 'iOS';
	@override String get android => 'Android';
}

// Path: search
class _TranslationsSearchFr implements TranslationsSearchEn {
	_TranslationsSearchFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String results({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Aucun résultat trouvé',
		one: '1 résultat trouvé',
		other: '${n} résultats trouvés',
	);
}

// Path: auth.not_logged_in
class _TranslationsAuthNotLoggedInFr implements TranslationsAuthNotLoggedInEn {
	_TranslationsAuthNotLoggedInFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Bienvenue sur Atomic Blend';
	@override String get description_start => 'Atomic Blend est la première';
	@override String get e2e_app => 'application chiffrée de bout en bout';
	@override String get description_middle => 'qui regroupe tous les outils dont vous avez besoin pour gérer à la fois votre travail et votre vie personnelle en un seul endroit.\n\nDe la gestion des tâches à la prise de notes, en passant par la rédaction de documents, le suivi du temps, le suivi des films, le suivi de l\'alimentation, tout reste';
	@override String get description_middle_bold => 'sécurisé et fluide.';
	@override String get description_end => 'Fini de jongler entre plusieurs applications—Atomic Blend rassemble tout avec la confidentialité au cœur de son fonctionnement, pour que vous puissiez vous concentrer sur l’essentiel.';
	@override String get time_to_set_things_up => 'À vous de jouer !';
	@override String get set_up_start => 'Pour utiliser Atomic Blend et synchroniser vos données sur tous vos appareils, vous pouvez choisir entre la version cloud ou une installation auto-hébergée.\n\nDans les deux cas, vos données sont';
	@override String get set_up_middle => 'chiffrées de bout en bout';
	@override String get set_up_end => ', garantissant que vous seul avez accès à votre clé de chiffrement —';
	@override String get set_up_end_bold => 'ni nous, ni personne d\'autre.';
	@override String get description => 'LifeOS est une application de gestion de la vie personnelle qui vous aide à organiser votre vie, à atteindre vos objectifs et à améliorer votre bien-être.';
	@override String get e2ee => 'Nous utilisons le chiffrement de bout en bout pour protéger vos données personnelles. Vos données sont sécurisées et accessibles uniquement par vous.';
	@override String get get_started_now => 'Commencez maintenant';
	@override String get i_agree_to => 'J\'accepte les';
	@override String get terms_of_service => 'Conditions d\'utilisation';
}

// Path: auth.login_or_register
class _TranslationsAuthLoginOrRegisterFr implements TranslationsAuthLoginOrRegisterEn {
	_TranslationsAuthLoginOrRegisterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Libérez le potentiel de votre vie';
	@override String get login_or_register => 'Connectez-vous ou inscrivez-vous';
	@override String get login => 'Se connecter';
	@override String get register => 'S\'inscrire';
	@override String get or => 'ou';
	@override String get connecting_to => 'Connexion à : ';
}

// Path: auth.login
class _TranslationsAuthLoginFr implements TranslationsAuthLoginEn {
	_TranslationsAuthLoginFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => '👋 Bon retour parmis nous !';
	@override String get description => 'Utilisez votre adresse e-mail et votre mot de passe pour vous reconnecter et accéder à vos données.';
	@override String get email => 'Adresse e-mail';
	@override String get forgot_password => 'Mot de passe oublié';
	@override String get login => 'Se connecter';
	@override String get no_account => 'Pas de compte ?';
	@override String get email_hint => 'Entrez votre adresse e-mail';
}

// Path: auth.register
class _TranslationsAuthRegisterFr implements TranslationsAuthRegisterEn {
	_TranslationsAuthRegisterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get email => 'Quelle est votre adresse e-mail ?';
	@override String get email_description => 'Votre e-mail est utilisé uniquement a des fins de connexion et de récupération de mot de passe.';
	@override String get we_never_sell => 'Nous ne vendrons jamais vos données à des tiers.';
	@override String get email_hint => 'email@example.com';
	@override String get password => 'Choisissez un mot de passe';
	@override String get password_hint => 'SuperSecure123!';
	@override String get forgot_password => 'Mot de passe oublié';
	@override String get confirmation_hint => 'Confirmez votre mot de passe';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get register => 'S\'inscrire';
	@override String get no_account => 'Pas de compte ?';
}

// Path: auth.delete_account
class _TranslationsAuthDeleteAccountFr implements TranslationsAuthDeleteAccountEn {
	_TranslationsAuthDeleteAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer mon compte';
	@override String get description => 'Etes-vous sûr de vouloir supprimer votre compte ?';
	@override String get cannot_be_undone => 'Cette action est irréversible et toutes vos données seront perdues.';
}

// Path: auth.mnemonic_key
class _TranslationsAuthMnemonicKeyFr implements TranslationsAuthMnemonicKeyEn {
	_TranslationsAuthMnemonicKeyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clé de récupération';
	@override String get description_start => 'Ceci est votre clé de récupération';
	@override String get description_mid => 'Écrivez-la sur un papier et gardez-la en sécurité.';
	@override String get description_end => 'Vous en aurez besoin pour récupérer l\'accès à vos données si vous perdez votre mot de passe.';
	@override String get mnemonic_hint => 'Entrez votre clé de récupération';
	@override String get mnemonic_error => 'Clé de récupération invalide';
	@override String get copy_success => 'Clé copiée dans le presse-papiers';
}

// Path: auth.reset_password
class _TranslationsAuthResetPasswordFr implements TranslationsAuthResetPasswordEn {
	_TranslationsAuthResetPasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reset your password';
	@override String get subtitle => 'Vous ne vous souvenez pas de votre mot de passe ?';
	@override String get description => 'Enter your email address to receive a password reset link.';
	@override String get warning => 'Vous allez recevoir un code par email pour réinitialiser votre mot de passe, puis vous devrez entrer votre clé de récupération pour accéder à vos données.';
	@override String get no_mnemonic_data_loss => 'Si vous ne vous rappelez pas de votre clé de récupération, vous perdrez accès à toutes vos précédentes données.';
	@override String get email => 'Email';
	@override String get email_description => 'L\'adresse e-mail utilisée pour vous inscrire.';
	@override String get email_hint => 'atomicblend@gmail.com';
	@override String get email_required => 'L\'adresse e-mail est requise';
	@override String get confirmation_code => 'Code de confirmation';
	@override String get confirmation_code_description => 'Entrez le code que vous avez reçu par e-mail.';
	@override String get confirmation_code_hint => 'a1b5c3d4';
	@override String get confirmation_code_required => 'Le code de confirmation est requis';
	@override String get enter_the_confirmation_code => 'Entrez le code de confirmation';
	@override String get confirmation_code_sent => 'Un code de confirmation a été envoyé à votre adresse e-mail.';
	@override String get confirmation_code_sent_description => 'Vérifiez votre boîte de réception et entrez le code ci-dessous.';
	@override String get do_you_have_your_mnemonic_key => 'Avez-vous votre clé de récupération ?';
	@override String get backup_key_description => 'C\'est une phrase de 12 mots qui vous a été fournie lors de votre inscription. Vous en aurez besoin pour récupérer vos données.';
	@override String get yes_i_have => 'Oui, je l\'ai et je veux récupérer mes données';
	@override String get no_i_dont => 'Non, je ne l\'ai pas et je veux supprimer mes données';
	@override String get reset_data_warning => 'Je suis conscient qu\'en sélectionnant cette option, toutes mes données seront éffacées sans aucune possibilité de récupération.';
	@override String get mnemonic_key => 'Clé de récupération';
	@override String get mnemonic_key_description => 'Saisis votre clé de récupération pour accéder à vos données.';
	@override String get mnemonic_key_hint => 'business theme rotate together surprise wisdom powder knee view border local runway';
	@override String get mnemonic_key_required => 'La clé de récupération est requise';
	@override String get select_your_new_password => 'Sélectionnez votre nouveau mot de passe';
	@override String get select_your_new_password_description => 'Entrez un mot de passe fort pour protéger votre compte.';
	@override String get new_password => 'Nouveau mot de passe';
	@override String get new_password_description => 'Entrez un nouveau mot de passe pour votre compte.';
	@override String get new_password_hint => 'SuperSecure123!';
	@override String get new_password_required => 'Nouveau mot de passe requis';
	@override String get confirm_new_password => 'Confirmer le mot de passe';
	@override String get confirm_new_password_description => 'Entrez à nouveau votre mot de passe pour le confirmer.';
	@override String get confirm_new_password_required => 'Confirmer le mot de passe requis';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get password_missing => 'Mot de passe manquant';
	@override String get password_too_short => 'Le mot de passe doit contenir au moins 8 caractères';
	@override String get recap_subtitle => 'Récapitulatif de la réinitialisation';
	@override String get yes => 'Oui';
	@override String get no => 'Non';
	@override String get confirm_reset => 'Confirmer la réinitialisation';
}

// Path: settings.app_settings
class _TranslationsSettingsAppSettingsFr implements TranslationsSettingsAppSettingsEn {
	_TranslationsSettingsAppSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres de l\'application';
	@override late final _TranslationsSettingsAppSettingsSelfHostedUrlFr selfHostedUrl = _TranslationsSettingsAppSettingsSelfHostedUrlFr._(_root);
}

// Path: tags.add_modal
class _TranslationsTagsAddModalFr implements TranslationsTagsAddModalEn {
	_TranslationsTagsAddModalFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajouter un nouveau tag';
	@override String get edit_title => 'Modifier le tag';
	@override String get name => 'Nom du tag';
	@override String get name_hint => 'Travail';
	@override String get name_description => 'Définissez un nom pour votre tag, cela sera affiché dans le tableau de bord et dans les notifications.';
	@override String get name_required => 'Le nom du tag est requis';
	@override String get color => 'Couleur du tag';
	@override String get color_description => 'Choisissez une couleur pour votre tag, cela vous aidera à le distinguer des autres.';
	@override String get primary => 'Primaire';
	@override String get accent => 'Accent';
	@override String get wheel => 'Roue';
}

// Path: tags.delete
class _TranslationsTagsDeleteFr implements TranslationsTagsDeleteEn {
	_TranslationsTagsDeleteFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer le tag';
	@override String get description => 'Êtes-vous sûr de vouloir supprimer ce tag ?';
	@override String get warning => 'Cette action est irréversible et le tag sera supprimé de tous les éléments associés.';
}

// Path: tasks.folders
class _TranslationsTasksFoldersFr implements TranslationsTasksFoldersEn {
	_TranslationsTasksFoldersFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dossiers';
	@override String get no_folders => 'Aucun dossier';
	@override String get add_folder => 'Ajouter un dossier';
	@override String get edit_folder => 'Modifier le dossier';
	@override String get delete_folder => 'Supprimer le dossier';
	@override String get delete_folder_description => 'Êtes-vous sûr de vouloir supprimer ce dossier ?';
	@override String get delete_folder_warning => 'Cette action est irréversible et toutes les tâches associées à ce dossier seront déliées.';
	@override String get name => 'Nom du dossier';
	@override String get name_hint => 'Travail';
	@override String get name_description => 'Définissez un nom pour votre dossier, cela sera affiché dans le tableau de bord et dans les notifications.';
	@override String get name_required => 'Nom requis';
	@override String get color => 'Couleur du dossier';
	@override String get color_description => 'Choisissez une couleur pour votre dossier, cela vous aidera à le distinguer des autres.';
	@override String get select_a_folder => 'Sélectionner un dossier';
}

// Path: tasks.due_dates
class _TranslationsTasksDueDatesFr implements TranslationsTasksDueDatesEn {
	_TranslationsTasksDueDatesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get tomorrow => 'Demain';
	@override String get no_due_date => 'Pas de date d\'échéance';
}

// Path: tasks.add_task_modal
class _TranslationsTasksAddTaskModalFr implements TranslationsTasksAddTaskModalEn {
	_TranslationsTasksAddTaskModalFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get task_title => 'Que devez-vous faire ?';
	@override String get description => 'Description';
	@override String get due_date => 'Date d\'échéance';
	@override String get start_date => 'Date de début';
	@override String get dates => 'Dates';
	@override String get notes => 'Notes';
	@override String get end_date => 'Date de fin';
	@override String get cancel => 'Annuler';
	@override String get task_added => 'Tâche ajoutée';
	@override String get task_added_description => 'Votre tâche a été ajoutée avec succès.';
	@override String get task_error => 'Erreur lors de l\'opération';
	@override String get save => 'Enregistrer';
	@override String get erase => 'Effacer';
	@override String get title_required => 'Titre requis';
	@override String get title_required_description => 'Veuillez saisir un titre pour votre tâche';
	@override String reminders({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Rappel',
		one: 'Rappel',
		other: 'Rappels',
	);
	@override String get time_planned => 'Heure prévue';
	@override String get none => 'Aucun';
	@override String get no_reminders => 'Pas de rappels';
	@override String get add_reminder => 'Ajouter un rappel';
	@override String get when_would_you_like_to_be_reminded => 'Quand aimeriez-vous être rappelé ?';
	@override String get when_would_you_like_the_task_to_start => 'Quand aimeriez-vous que la tâche commence ?';
	@override String get when_would_you_like_the_task_to_end => 'Quand aimeriez-vous que la tâche se termine ?';
}

// Path: tasks.add_time_entry
class _TranslationsTasksAddTimeEntryFr implements TranslationsTasksAddTimeEntryEn {
	_TranslationsTasksAddTimeEntryFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ajouter une entrée de temps';
	@override String get description => 'Manually add a time entry for this task.';
	@override String get start_time => 'Heure de début';
	@override String get end_time => 'Heure de fin';
	@override String get not_defined => 'Non défini';
	@override String get date_required => 'Date requise';
}

// Path: calendar.errors
class _TranslationsCalendarErrorsFr implements TranslationsCalendarErrorsEn {
	_TranslationsCalendarErrorsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get cannot_move_device_calendar_event => 'Vous ne pouvez pas déplacer un événement de calendrier d\'appareil';
	@override String get cannot_move_habit_event => 'Vous ne pouvez pas déplacer un événement d\'habitude';
	@override String get cannot_resize_device_calendar_event => 'Vous ne pouvez pas redimensionner un événement de calendrier d\'appareil';
	@override String get cannot_resize_habit_event => 'Vous ne pouvez pas redimensionner un événement d\'habitude';
}

// Path: calendar.event_detail
class _TranslationsCalendarEventDetailFr implements TranslationsCalendarEventDetailEn {
	_TranslationsCalendarEventDetailFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get date => 'Date';
	@override String get time => 'Heure';
	@override String get organizer => 'Organisateur';
	@override String get reminders => 'Rappels';
	@override String get no_reminders => 'Pas de rappels';
	@override String get details => 'Détails';
	@override String get join_meeting => 'Rejoindre la réunion';
	@override String get google_meet_call => 'Appel Meet Call';
	@override String get zoom_meet_call => 'Appel Zoom';
	@override String get ms_teams_call => 'Appel MS Teams';
	@override String get join_now => 'Rejoindre maintenant';
	@override String attendee({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Participant',
		one: 'Participant',
		other: 'Participants',
	);
	@override String get no_attendees => 'Pas de participants';
	@override String get no_notes => 'Pas de notes';
}

// Path: calendar.settings
class _TranslationsCalendarSettingsFr implements TranslationsCalendarSettingsEn {
	_TranslationsCalendarSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres du calendrier';
	@override String get display_habits => 'Afficher les habitudes';
}

// Path: account.sections
class _TranslationsAccountSectionsFr implements TranslationsAccountSectionsEn {
	_TranslationsAccountSectionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get account => 'Compte';
}

// Path: account.actions
class _TranslationsAccountActionsFr implements TranslationsAccountActionsEn {
	_TranslationsAccountActionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get security => 'Sécurité et confidentialité';
	@override String get delete_account => 'Supprimer mon compte';
}

// Path: account.subscription_payments
class _TranslationsAccountSubscriptionPaymentsFr implements TranslationsAccountSubscriptionPaymentsEn {
	_TranslationsAccountSubscriptionPaymentsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Abonnement & Paiements';
	@override String subscription({required Object subName}) => 'Abonnement ${subName}';
	@override String get latest_subscription => 'Ceci est votre abonnement avec la date de facturation la plus récente.';
	@override String get billing_cycle => 'Cycle de facturation';
	@override String get current_price => 'Prix actuel';
	@override String get next_billing_date => 'Prochaine date de facturation';
	@override String get payment_history => 'Historique des paiements';
	@override String get no_payments => 'Aucun paiement trouvé';
	@override String get currency_symbol => '\$';
	@override String get manage_my_subscription => 'Gérer mon abonnement';
	@override String get management_url_only_mobile => 'Vous ne pouvez gérer votre abonnement que depuis l\'application iOS ou Android.';
}

// Path: account.profile
class _TranslationsAccountProfileFr implements TranslationsAccountProfileEn {
	_TranslationsAccountProfileFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get my_profile => 'Mon profil';
	@override String get email => 'Adresse e-mail';
	@override String get undefined => 'Non défini';
	@override String get email_missing => 'Adresse e-mail manquante';
	@override String get email_same => 'L\'adresse e-mail doit être différente de l\'adresse e-mail actuelle';
}

// Path: account.security_and_privacy
class _TranslationsAccountSecurityAndPrivacyFr implements TranslationsAccountSecurityAndPrivacyEn {
	_TranslationsAccountSecurityAndPrivacyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sécurité et confidentialité';
	@override late final _TranslationsAccountSecurityAndPrivacyChangePasswordFr change_password = _TranslationsAccountSecurityAndPrivacyChangePasswordFr._(_root);
}

// Path: habits.delete_habit
class _TranslationsHabitsDeleteHabitFr implements TranslationsHabitsDeleteHabitEn {
	_TranslationsHabitsDeleteHabitFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer l\'habitude';
	@override String get description => 'Êtes-vous sûr de vouloir supprimer cette habitude ?';
	@override String get warning => 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.';
}

// Path: habits.add
class _TranslationsHabitsAddFr implements TranslationsHabitsAddEn {
	_TranslationsHabitsAddFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Que souhaitez-vous accomplir ?';
	@override String get name => 'Nom de l\'habitude*';
	@override String get name_hint => 'Boire de l\'eau';
	@override String get name_description => 'Définissez un nom pour votre habitude, cela sera affiché dans le tableau de bord et dans les notifications.';
	@override String get name_required => 'Le nom de l\'habitude est requis';
	@override String get citation => 'Citation';
	@override String get citation_description => 'Ajoutez une citation à votre habitude, cela vous aidera à vous souvenir de la raison pour laquelle vous la suivez et vous motivera.';
	@override String get citation_hint => '“L\'eau est la seule boisson d\'un homme sage.” - Henry David Thoreau';
	@override String get start_date => 'Date de début';
	@override String get end_date => 'Date de fin';
	@override String get when_would_you_like_the_habit_to_start => 'Quand aimeriez-vous que l\'habitude commence ?';
	@override String get when_would_you_like_the_habit_to_end => 'Quand aimeriez-vous que l\'habitude se termine ?';
	@override String get no_date_selected => 'Pas de date sélectionnée';
	@override String get frequency_label => 'Fréquence';
	@override Map<String, String> get frequency => {
		'daily': 'Journalier',
		'weekly': 'Hebdomadaire',
		'monthly': 'Mensuel',
		'repeatition': 'Répétition',
	};
	@override String get number_of_times_label => 'Nombre de fois';
	@override String get number_of_times_description => 'Combien de fois voulez-vous faire cette habitude ?\nSera réinitialisé à chaque fois que la fréquence est atteinte (par exemple, si vous le réglez sur 3 fois et une fréquence quotidienne, vous devrez le faire 3 fois par jour)..';
	@override String get days_of_week_label => 'Jours de la semaine';
	@override String get days_of_week_description => 'Quels jours de la semaine souhaitez-vous suivre cette habitude ?';
	@override String get search_emoji_hint => 'Rechercher un emoji';
	@override String get reminders_label => 'Rappels';
	@override String get reminders_description => 'Fixez une heure pour vos rappels. Vous serez averti lorsque l\'heure sera atteinte.';
	@override String get reminders_add => 'Ajouter un rappel';
	@override String get duration_label => 'Durée';
	@override String get duration_description => 'Combien de temps dure cette habitude ?';
	@override String get duration_hint => '5 minutes';
	@override String get name_too_short => 'Le nom de l\'habitude doit contenir au moins 4 caractères';
	@override String get days_of_week_mismatch => 'Vous devez sélectionner autant de jours que le nombre de fois que vous avez défini';
	@override String get every_number_day_title => 'Interval de répétition';
	@override String get every_number_day_description => 'Combien de jours entre chaque répétition ?';
	@override String get days_of_month_title => 'Jours du mois';
	@override String get days_of_month_description => 'Quels jours du mois souhaitez-vous suivre cette habitude ?';
	@override String get select_days => 'Sélectionner les jours';
}

// Path: habits.habit_detail
class _TranslationsHabitsHabitDetailFr implements TranslationsHabitsHabitDetailEn {
	_TranslationsHabitsHabitDetailFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get no_citation => 'Pas de citation';
	@override String get no_end_date => 'Pas de date de fin';
	@override String get delete_habit => 'Supprimer l\'habitude';
	@override String get delete_habit_description => 'Êtes-vous sûr de vouloir supprimer cette habitude ?';
	@override String get delete_habit_warning => 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.';
	@override String get entries => 'Historique';
	@override String get no_entries => 'Pas d\'entrées pour le moment';
	@override String get delete_entry => 'Supprimer l\'entrée';
	@override String get delete_entry_description => 'Êtes-vous sûr de vouloir supprimer cette entrée ?';
	@override String get delete_entry_warning => 'Cette action est irréversible.';
}

// Path: time_units.short
class _TranslationsTimeUnitsShortFr implements TranslationsTimeUnitsShortEn {
	_TranslationsTimeUnitsShortFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get day => 'j';
	@override String get hour => 'h';
	@override String get minute => 'm';
}

// Path: time_units.long
class _TranslationsTimeUnitsLongFr implements TranslationsTimeUnitsLongEn {
	_TranslationsTimeUnitsLongFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String day({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'jour',
		one: 'jour',
		other: 'jours',
	);
	@override String hour({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'heure',
		one: 'heure',
		other: 'heures',
	);
	@override String minute({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'minute',
		one: 'minute',
		other: 'minutes',
	);
}

// Path: paywall.advantages
class _TranslationsPaywallAdvantagesFr implements TranslationsPaywallAdvantagesEn {
	_TranslationsPaywallAdvantagesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr all_apps_of_the_suite = _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr._(_root);
	@override late final _TranslationsPaywallAdvantagesEndToEndEncryptedFr end_to_end_encrypted = _TranslationsPaywallAdvantagesEndToEndEncryptedFr._(_root);
	@override late final _TranslationsPaywallAdvantagesUnlimitedTasksFr unlimited_tasks = _TranslationsPaywallAdvantagesUnlimitedTasksFr._(_root);
	@override late final _TranslationsPaywallAdvantagesUnlimitedHabitsFr unlimited_habits = _TranslationsPaywallAdvantagesUnlimitedHabitsFr._(_root);
	@override late final _TranslationsPaywallAdvantagesUnlimitedTagsFr unlimited_tags = _TranslationsPaywallAdvantagesUnlimitedTagsFr._(_root);
	@override late final _TranslationsPaywallAdvantagesSyncAcrossDevicesFr sync_across_devices = _TranslationsPaywallAdvantagesSyncAcrossDevicesFr._(_root);
	@override late final _TranslationsPaywallAdvantagesCommunityBackedFr community_backed = _TranslationsPaywallAdvantagesCommunityBackedFr._(_root);
}

// Path: paywall.pricing.\$rc_annual
class _TranslationsPaywallPricing$rcAnnualFr implements TranslationsPaywallPricing$rcAnnualEn {
	_TranslationsPaywallPricing$rcAnnualFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Annuel';
	@override String get price => '3.33€/mo';
	@override String get billed => 'facturé à 39.99€/an';
	@override String get discount => '16% off';
}

// Path: paywall.pricing.\$rc_monthly
class _TranslationsPaywallPricing$rcMonthlyFr implements TranslationsPaywallPricing$rcMonthlyEn {
	_TranslationsPaywallPricing$rcMonthlyFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mensuel';
	@override String get price => '3.99€/mo';
	@override String get billed => 'facturé à 3.99€/mois';
	@override String get discount => '';
}

// Path: settings.app_settings.selfHostedUrl
class _TranslationsSettingsAppSettingsSelfHostedUrlFr implements TranslationsSettingsAppSettingsSelfHostedUrlEn {
	_TranslationsSettingsAppSettingsSelfHostedUrlFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL auto-hébergée';
	@override String get description => 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.';
	@override String get placeholder => 'Entrez l\'URL de votre instance';
	@override String get not_set => 'Non défini';
}

// Path: account.security_and_privacy.change_password
class _TranslationsAccountSecurityAndPrivacyChangePasswordFr implements TranslationsAccountSecurityAndPrivacyChangePasswordEn {
	_TranslationsAccountSecurityAndPrivacyChangePasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Changer le mot de passe';
	@override String get old_password => 'Ancien mot de passe';
	@override String get new_password => 'Nouveau mot de passe';
	@override String get confirm_password => 'Confirmer le mot de passe';
	@override String get old_password_required => 'Ancien mot de passe requis';
	@override String get new_password_required => 'Nouveau mot de passe requis';
	@override String get confirm_password_required => 'Confirmer le mot de passe requis';
	@override String get password_mismatch => 'Les mots de passe ne correspondent pas';
	@override String get password_hint => 'SuperSecure123!';
	@override String get warning_changing_pws_will_log_you_out => 'Changer le mot de passe vous déconnectera de l\'application.';
}

// Path: paywall.advantages.all_apps_of_the_suite
class _TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr implements TranslationsPaywallAdvantagesAllAppsOfTheSuiteEn {
	_TranslationsPaywallAdvantagesAllAppsOfTheSuiteFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Toutes les applications de la suite';
	@override String get description => 'Accédez à toutes les applications de la suite, y compris Tâches, Habitudes, Calendrier, Notes, et plus encore.';
}

// Path: paywall.advantages.end_to_end_encrypted
class _TranslationsPaywallAdvantagesEndToEndEncryptedFr implements TranslationsPaywallAdvantagesEndToEndEncryptedEn {
	_TranslationsPaywallAdvantagesEndToEndEncryptedFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chiffrement de bout en bout';
	@override String get description => 'Vos données sont à vous, pour toujours.';
}

// Path: paywall.advantages.unlimited_tasks
class _TranslationsPaywallAdvantagesUnlimitedTasksFr implements TranslationsPaywallAdvantagesUnlimitedTasksEn {
	_TranslationsPaywallAdvantagesUnlimitedTasksFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tâches Illimitées';
	@override String get description => 'Créez autant de tâches que vous le souhaitez, sans limites.';
}

// Path: paywall.advantages.unlimited_habits
class _TranslationsPaywallAdvantagesUnlimitedHabitsFr implements TranslationsPaywallAdvantagesUnlimitedHabitsEn {
	_TranslationsPaywallAdvantagesUnlimitedHabitsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Habitudes Illimitées';
	@override String get description => 'Faites un pas vers une vie plus saine avec des habitudes illimitées.';
}

// Path: paywall.advantages.unlimited_tags
class _TranslationsPaywallAdvantagesUnlimitedTagsFr implements TranslationsPaywallAdvantagesUnlimitedTagsEn {
	_TranslationsPaywallAdvantagesUnlimitedTagsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tags / Dossiers Illimités';
	@override String get description => 'Utilisez autant de tags et de dossiers que nécessaire pour organiser votre vie.';
}

// Path: paywall.advantages.sync_across_devices
class _TranslationsPaywallAdvantagesSyncAcrossDevicesFr implements TranslationsPaywallAdvantagesSyncAcrossDevicesEn {
	_TranslationsPaywallAdvantagesSyncAcrossDevicesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronisation entre appareils';
	@override String get description => 'Accédez à vos données depuis n\'importe quel appareil, n\'importe où.';
}

// Path: paywall.advantages.community_backed
class _TranslationsPaywallAdvantagesCommunityBackedFr implements TranslationsPaywallAdvantagesCommunityBackedEn {
	_TranslationsPaywallAdvantagesCommunityBackedFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Soutien de la communauté';
	@override String get description => '100% opensource : rejoignez une communauté d\'utilisateurs qui soutiennent le projet.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
			case 'app_name_saas': return 'Atomic Blend Cloud';
			case 'navigation.back': return 'Retour';
			case 'auth.not_logged_in.welcome': return 'Bienvenue sur Atomic Blend';
			case 'auth.not_logged_in.description_start': return 'Atomic Blend est la première';
			case 'auth.not_logged_in.e2e_app': return 'application chiffrée de bout en bout';
			case 'auth.not_logged_in.description_middle': return 'qui regroupe tous les outils dont vous avez besoin pour gérer à la fois votre travail et votre vie personnelle en un seul endroit.\n\nDe la gestion des tâches à la prise de notes, en passant par la rédaction de documents, le suivi du temps, le suivi des films, le suivi de l\'alimentation, tout reste';
			case 'auth.not_logged_in.description_middle_bold': return 'sécurisé et fluide.';
			case 'auth.not_logged_in.description_end': return 'Fini de jongler entre plusieurs applications—Atomic Blend rassemble tout avec la confidentialité au cœur de son fonctionnement, pour que vous puissiez vous concentrer sur l’essentiel.';
			case 'auth.not_logged_in.time_to_set_things_up': return 'À vous de jouer !';
			case 'auth.not_logged_in.set_up_start': return 'Pour utiliser Atomic Blend et synchroniser vos données sur tous vos appareils, vous pouvez choisir entre la version cloud ou une installation auto-hébergée.\n\nDans les deux cas, vos données sont';
			case 'auth.not_logged_in.set_up_middle': return 'chiffrées de bout en bout';
			case 'auth.not_logged_in.set_up_end': return ', garantissant que vous seul avez accès à votre clé de chiffrement —';
			case 'auth.not_logged_in.set_up_end_bold': return 'ni nous, ni personne d\'autre.';
			case 'auth.not_logged_in.description': return 'LifeOS est une application de gestion de la vie personnelle qui vous aide à organiser votre vie, à atteindre vos objectifs et à améliorer votre bien-être.';
			case 'auth.not_logged_in.e2ee': return 'Nous utilisons le chiffrement de bout en bout pour protéger vos données personnelles. Vos données sont sécurisées et accessibles uniquement par vous.';
			case 'auth.not_logged_in.get_started_now': return 'Commencez maintenant';
			case 'auth.not_logged_in.i_agree_to': return 'J\'accepte les';
			case 'auth.not_logged_in.terms_of_service': return 'Conditions d\'utilisation';
			case 'auth.login_or_register.title': return 'Libérez le potentiel de votre vie';
			case 'auth.login_or_register.login_or_register': return 'Connectez-vous ou inscrivez-vous';
			case 'auth.login_or_register.login': return 'Se connecter';
			case 'auth.login_or_register.register': return 'S\'inscrire';
			case 'auth.login_or_register.or': return 'ou';
			case 'auth.login_or_register.connecting_to': return 'Connexion à : ';
			case 'auth.login.title': return '👋 Bon retour parmis nous !';
			case 'auth.login.description': return 'Utilisez votre adresse e-mail et votre mot de passe pour vous reconnecter et accéder à vos données.';
			case 'auth.login.email': return 'Adresse e-mail';
			case 'auth.login.forgot_password': return 'Mot de passe oublié';
			case 'auth.login.login': return 'Se connecter';
			case 'auth.login.no_account': return 'Pas de compte ?';
			case 'auth.login.email_hint': return 'Entrez votre adresse e-mail';
			case 'auth.register.email': return 'Quelle est votre adresse e-mail ?';
			case 'auth.register.email_description': return 'Votre e-mail est utilisé uniquement a des fins de connexion et de récupération de mot de passe.';
			case 'auth.register.we_never_sell': return 'Nous ne vendrons jamais vos données à des tiers.';
			case 'auth.register.email_hint': return 'email@example.com';
			case 'auth.register.password': return 'Choisissez un mot de passe';
			case 'auth.register.password_hint': return 'SuperSecure123!';
			case 'auth.register.forgot_password': return 'Mot de passe oublié';
			case 'auth.register.confirmation_hint': return 'Confirmez votre mot de passe';
			case 'auth.register.password_mismatch': return 'Les mots de passe ne correspondent pas';
			case 'auth.register.register': return 'S\'inscrire';
			case 'auth.register.no_account': return 'Pas de compte ?';
			case 'auth.delete_account.title': return 'Supprimer mon compte';
			case 'auth.delete_account.description': return 'Etes-vous sûr de vouloir supprimer votre compte ?';
			case 'auth.delete_account.cannot_be_undone': return 'Cette action est irréversible et toutes vos données seront perdues.';
			case 'auth.mnemonic_key.title': return 'Clé de récupération';
			case 'auth.mnemonic_key.description_start': return 'Ceci est votre clé de récupération';
			case 'auth.mnemonic_key.description_mid': return 'Écrivez-la sur un papier et gardez-la en sécurité.';
			case 'auth.mnemonic_key.description_end': return 'Vous en aurez besoin pour récupérer l\'accès à vos données si vous perdez votre mot de passe.';
			case 'auth.mnemonic_key.mnemonic_hint': return 'Entrez votre clé de récupération';
			case 'auth.mnemonic_key.mnemonic_error': return 'Clé de récupération invalide';
			case 'auth.mnemonic_key.copy_success': return 'Clé copiée dans le presse-papiers';
			case 'auth.reset_password.title': return 'Reset your password';
			case 'auth.reset_password.subtitle': return 'Vous ne vous souvenez pas de votre mot de passe ?';
			case 'auth.reset_password.description': return 'Enter your email address to receive a password reset link.';
			case 'auth.reset_password.warning': return 'Vous allez recevoir un code par email pour réinitialiser votre mot de passe, puis vous devrez entrer votre clé de récupération pour accéder à vos données.';
			case 'auth.reset_password.no_mnemonic_data_loss': return 'Si vous ne vous rappelez pas de votre clé de récupération, vous perdrez accès à toutes vos précédentes données.';
			case 'auth.reset_password.email': return 'Email';
			case 'auth.reset_password.email_description': return 'L\'adresse e-mail utilisée pour vous inscrire.';
			case 'auth.reset_password.email_hint': return 'atomicblend@gmail.com';
			case 'auth.reset_password.email_required': return 'L\'adresse e-mail est requise';
			case 'auth.reset_password.confirmation_code': return 'Code de confirmation';
			case 'auth.reset_password.confirmation_code_description': return 'Entrez le code que vous avez reçu par e-mail.';
			case 'auth.reset_password.confirmation_code_hint': return 'a1b5c3d4';
			case 'auth.reset_password.confirmation_code_required': return 'Le code de confirmation est requis';
			case 'auth.reset_password.enter_the_confirmation_code': return 'Entrez le code de confirmation';
			case 'auth.reset_password.confirmation_code_sent': return 'Un code de confirmation a été envoyé à votre adresse e-mail.';
			case 'auth.reset_password.confirmation_code_sent_description': return 'Vérifiez votre boîte de réception et entrez le code ci-dessous.';
			case 'auth.reset_password.do_you_have_your_mnemonic_key': return 'Avez-vous votre clé de récupération ?';
			case 'auth.reset_password.backup_key_description': return 'C\'est une phrase de 12 mots qui vous a été fournie lors de votre inscription. Vous en aurez besoin pour récupérer vos données.';
			case 'auth.reset_password.yes_i_have': return 'Oui, je l\'ai et je veux récupérer mes données';
			case 'auth.reset_password.no_i_dont': return 'Non, je ne l\'ai pas et je veux supprimer mes données';
			case 'auth.reset_password.reset_data_warning': return 'Je suis conscient qu\'en sélectionnant cette option, toutes mes données seront éffacées sans aucune possibilité de récupération.';
			case 'auth.reset_password.mnemonic_key': return 'Clé de récupération';
			case 'auth.reset_password.mnemonic_key_description': return 'Saisis votre clé de récupération pour accéder à vos données.';
			case 'auth.reset_password.mnemonic_key_hint': return 'business theme rotate together surprise wisdom powder knee view border local runway';
			case 'auth.reset_password.mnemonic_key_required': return 'La clé de récupération est requise';
			case 'auth.reset_password.select_your_new_password': return 'Sélectionnez votre nouveau mot de passe';
			case 'auth.reset_password.select_your_new_password_description': return 'Entrez un mot de passe fort pour protéger votre compte.';
			case 'auth.reset_password.new_password': return 'Nouveau mot de passe';
			case 'auth.reset_password.new_password_description': return 'Entrez un nouveau mot de passe pour votre compte.';
			case 'auth.reset_password.new_password_hint': return 'SuperSecure123!';
			case 'auth.reset_password.new_password_required': return 'Nouveau mot de passe requis';
			case 'auth.reset_password.confirm_new_password': return 'Confirmer le mot de passe';
			case 'auth.reset_password.confirm_new_password_description': return 'Entrez à nouveau votre mot de passe pour le confirmer.';
			case 'auth.reset_password.confirm_new_password_required': return 'Confirmer le mot de passe requis';
			case 'auth.reset_password.password_mismatch': return 'Les mots de passe ne correspondent pas';
			case 'auth.reset_password.password_missing': return 'Mot de passe manquant';
			case 'auth.reset_password.password_too_short': return 'Le mot de passe doit contenir au moins 8 caractères';
			case 'auth.reset_password.recap_subtitle': return 'Récapitulatif de la réinitialisation';
			case 'auth.reset_password.yes': return 'Oui';
			case 'auth.reset_password.no': return 'Non';
			case 'auth.reset_password.confirm_reset': return 'Confirmer la réinitialisation';
			case 'settings.title': return 'Paramètres';
			case 'settings.app_settings.title': return 'Paramètres de l\'application';
			case 'settings.app_settings.selfHostedUrl.title': return 'URL auto-hébergée';
			case 'settings.app_settings.selfHostedUrl.description': return 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.';
			case 'settings.app_settings.selfHostedUrl.placeholder': return 'Entrez l\'URL de votre instance';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Non défini';
			case 'settings.logout': return 'Déconnexion';
			case 'tags.title': return 'Tags';
			case 'tags.no_tags': return 'Aucun tag';
			case 'tags.assign_tags': return 'Assigner des tags';
			case 'tags.add_modal.title': return 'Ajouter un nouveau tag';
			case 'tags.add_modal.edit_title': return 'Modifier le tag';
			case 'tags.add_modal.name': return 'Nom du tag';
			case 'tags.add_modal.name_hint': return 'Travail';
			case 'tags.add_modal.name_description': return 'Définissez un nom pour votre tag, cela sera affiché dans le tableau de bord et dans les notifications.';
			case 'tags.add_modal.name_required': return 'Le nom du tag est requis';
			case 'tags.add_modal.color': return 'Couleur du tag';
			case 'tags.add_modal.color_description': return 'Choisissez une couleur pour votre tag, cela vous aidera à le distinguer des autres.';
			case 'tags.add_modal.primary': return 'Primaire';
			case 'tags.add_modal.accent': return 'Accent';
			case 'tags.add_modal.wheel': return 'Roue';
			case 'tags.delete.title': return 'Supprimer le tag';
			case 'tags.delete.description': return 'Êtes-vous sûr de vouloir supprimer ce tag ?';
			case 'tags.delete.warning': return 'Cette action est irréversible et le tag sera supprimé de tous les éléments associés.';
			case 'tasks.title': return 'Tâches';
			case 'tasks.today': return 'Aujourd\'hui';
			case 'tasks.tags': return 'Tags';
			case 'tasks.inbox': return 'Boîte de réception';
			case 'tasks.all_tasks': return 'Toutes les tâches';
			case 'tasks.completed_tasks': return 'Tâches terminées';
			case 'tasks.my_tags': return 'Mes tags';
			case 'tasks.no_tags_for_now': return 'Pas de tags pour le moment';
			case 'tasks.my_folders': return 'Mes dossiers';
			case 'tasks.folders.title': return 'Dossiers';
			case 'tasks.folders.no_folders': return 'Aucun dossier';
			case 'tasks.folders.add_folder': return 'Ajouter un dossier';
			case 'tasks.folders.edit_folder': return 'Modifier le dossier';
			case 'tasks.folders.delete_folder': return 'Supprimer le dossier';
			case 'tasks.folders.delete_folder_description': return 'Êtes-vous sûr de vouloir supprimer ce dossier ?';
			case 'tasks.folders.delete_folder_warning': return 'Cette action est irréversible et toutes les tâches associées à ce dossier seront déliées.';
			case 'tasks.folders.name': return 'Nom du dossier';
			case 'tasks.folders.name_hint': return 'Travail';
			case 'tasks.folders.name_description': return 'Définissez un nom pour votre dossier, cela sera affiché dans le tableau de bord et dans les notifications.';
			case 'tasks.folders.name_required': return 'Nom requis';
			case 'tasks.folders.color': return 'Couleur du dossier';
			case 'tasks.folders.color_description': return 'Choisissez une couleur pour votre dossier, cela vous aidera à le distinguer des autres.';
			case 'tasks.folders.select_a_folder': return 'Sélectionner un dossier';
			case 'tasks.overview': return 'Vue d\'ensemble';
			case 'tasks.nothing_to_do': return 'Rien à faire pour le moment, vous pouvez vous détendre !';
			case 'tasks.day_off': return 'Vous n\'avez rien de prévu pour demain, profitez-en !';
			case 'tasks.week_off': return 'Vous n\'avez rien de prévu pour cette semaine, essayez de prendre le temps de faire les choses laissées de côté !';
			case 'tasks.no_tasks_for_now': return 'Pas de tâches pour le moment';
			case 'tasks.task_details': return 'Détail de la tâche';
			case 'tasks.time_log': return 'Journal';
			case 'tasks.log_session': return 'Journaliser une session';
			case 'tasks.timer': return 'Chronomètre';
			case 'tasks.pomodoro': return 'Pomodoro';
			case 'tasks.manual': return 'Manuel';
			case 'tasks.from': return 'De';
			case 'tasks.to': return 'À';
			case 'tasks.priority': return 'Priorité';
			case 'tasks.priorities.none': return 'Aucune';
			case 'tasks.priorities.low': return 'Faible';
			case 'tasks.priorities.medium': return 'Moyenne';
			case 'tasks.priorities.high': return 'Haute';
			case 'tasks.due_dates.today': return 'Aujourd\'hui';
			case 'tasks.due_dates.tomorrow': return 'Demain';
			case 'tasks.due_dates.no_due_date': return 'Pas de date d\'échéance';
			case 'tasks.add_task_modal.task_title': return 'Que devez-vous faire ?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.due_date': return 'Date d\'échéance';
			case 'tasks.add_task_modal.start_date': return 'Date de début';
			case 'tasks.add_task_modal.dates': return 'Dates';
			case 'tasks.add_task_modal.notes': return 'Notes';
			case 'tasks.add_task_modal.end_date': return 'Date de fin';
			case 'tasks.add_task_modal.cancel': return 'Annuler';
			case 'tasks.add_task_modal.task_added': return 'Tâche ajoutée';
			case 'tasks.add_task_modal.task_added_description': return 'Votre tâche a été ajoutée avec succès.';
			case 'tasks.add_task_modal.task_error': return 'Erreur lors de l\'opération';
			case 'tasks.add_task_modal.save': return 'Enregistrer';
			case 'tasks.add_task_modal.erase': return 'Effacer';
			case 'tasks.add_task_modal.title_required': return 'Titre requis';
			case 'tasks.add_task_modal.title_required_description': return 'Veuillez saisir un titre pour votre tâche';
			case 'tasks.add_task_modal.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Rappel',
				one: 'Rappel',
				other: 'Rappels',
			);
			case 'tasks.add_task_modal.time_planned': return 'Heure prévue';
			case 'tasks.add_task_modal.none': return 'Aucun';
			case 'tasks.add_task_modal.no_reminders': return 'Pas de rappels';
			case 'tasks.add_task_modal.add_reminder': return 'Ajouter un rappel';
			case 'tasks.add_task_modal.when_would_you_like_to_be_reminded': return 'Quand aimeriez-vous être rappelé ?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_start': return 'Quand aimeriez-vous que la tâche commence ?';
			case 'tasks.add_task_modal.when_would_you_like_the_task_to_end': return 'Quand aimeriez-vous que la tâche se termine ?';
			case 'tasks.time_spent': return 'Temps passé';
			case 'tasks.no_time_entries': return 'Pas d\'entrées de temps';
			case 'tasks.add_time_entry.title': return 'Ajouter une entrée de temps';
			case 'tasks.add_time_entry.description': return 'Manually add a time entry for this task.';
			case 'tasks.add_time_entry.start_time': return 'Heure de début';
			case 'tasks.add_time_entry.end_time': return 'Heure de fin';
			case 'tasks.add_time_entry.not_defined': return 'Non défini';
			case 'tasks.add_time_entry.date_required': return 'Date requise';
			case 'calendar.title': return 'Calendrier';
			case 'calendar.month': return 'Mois';
			case 'calendar.day': return 'Jour';
			case 'calendar.threeDays': return '3 jours';
			case 'calendar.week': return 'Semaine';
			case 'calendar.schedule': return 'Emploi du temps';
			case 'calendar.errors.cannot_move_device_calendar_event': return 'Vous ne pouvez pas déplacer un événement de calendrier d\'appareil';
			case 'calendar.errors.cannot_move_habit_event': return 'Vous ne pouvez pas déplacer un événement d\'habitude';
			case 'calendar.errors.cannot_resize_device_calendar_event': return 'Vous ne pouvez pas redimensionner un événement de calendrier d\'appareil';
			case 'calendar.errors.cannot_resize_habit_event': return 'Vous ne pouvez pas redimensionner un événement d\'habitude';
			case 'calendar.event_detail.date': return 'Date';
			case 'calendar.event_detail.time': return 'Heure';
			case 'calendar.event_detail.organizer': return 'Organisateur';
			case 'calendar.event_detail.reminders': return 'Rappels';
			case 'calendar.event_detail.no_reminders': return 'Pas de rappels';
			case 'calendar.event_detail.details': return 'Détails';
			case 'calendar.event_detail.join_meeting': return 'Rejoindre la réunion';
			case 'calendar.event_detail.google_meet_call': return 'Appel Meet Call';
			case 'calendar.event_detail.zoom_meet_call': return 'Appel Zoom';
			case 'calendar.event_detail.ms_teams_call': return 'Appel MS Teams';
			case 'calendar.event_detail.join_now': return 'Rejoindre maintenant';
			case 'calendar.event_detail.attendee': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Participant',
				one: 'Participant',
				other: 'Participants',
			);
			case 'calendar.event_detail.no_attendees': return 'Pas de participants';
			case 'calendar.event_detail.no_notes': return 'Pas de notes';
			case 'calendar.settings.title': return 'Paramètres du calendrier';
			case 'calendar.settings.display_habits': return 'Afficher les habitudes';
			case 'account.edit_profile': return 'Modifier le profil';
			case 'account.sections.account': return 'Compte';
			case 'account.actions.security': return 'Sécurité et confidentialité';
			case 'account.actions.delete_account': return 'Supprimer mon compte';
			case 'account.subscription_payments.title': return 'Abonnement & Paiements';
			case 'account.subscription_payments.subscription': return ({required Object subName}) => 'Abonnement ${subName}';
			case 'account.subscription_payments.latest_subscription': return 'Ceci est votre abonnement avec la date de facturation la plus récente.';
			case 'account.subscription_payments.billing_cycle': return 'Cycle de facturation';
			case 'account.subscription_payments.current_price': return 'Prix actuel';
			case 'account.subscription_payments.next_billing_date': return 'Prochaine date de facturation';
			case 'account.subscription_payments.payment_history': return 'Historique des paiements';
			case 'account.subscription_payments.no_payments': return 'Aucun paiement trouvé';
			case 'account.subscription_payments.currency_symbol': return '\$';
			case 'account.subscription_payments.manage_my_subscription': return 'Gérer mon abonnement';
			case 'account.subscription_payments.management_url_only_mobile': return 'Vous ne pouvez gérer votre abonnement que depuis l\'application iOS ou Android.';
			case 'account.profile.my_profile': return 'Mon profil';
			case 'account.profile.email': return 'Adresse e-mail';
			case 'account.profile.undefined': return 'Non défini';
			case 'account.profile.email_missing': return 'Adresse e-mail manquante';
			case 'account.profile.email_same': return 'L\'adresse e-mail doit être différente de l\'adresse e-mail actuelle';
			case 'account.security_and_privacy.title': return 'Sécurité et confidentialité';
			case 'account.security_and_privacy.change_password.title': return 'Changer le mot de passe';
			case 'account.security_and_privacy.change_password.old_password': return 'Ancien mot de passe';
			case 'account.security_and_privacy.change_password.new_password': return 'Nouveau mot de passe';
			case 'account.security_and_privacy.change_password.confirm_password': return 'Confirmer le mot de passe';
			case 'account.security_and_privacy.change_password.old_password_required': return 'Ancien mot de passe requis';
			case 'account.security_and_privacy.change_password.new_password_required': return 'Nouveau mot de passe requis';
			case 'account.security_and_privacy.change_password.confirm_password_required': return 'Confirmer le mot de passe requis';
			case 'account.security_and_privacy.change_password.password_mismatch': return 'Les mots de passe ne correspondent pas';
			case 'account.security_and_privacy.change_password.password_hint': return 'SuperSecure123!';
			case 'account.security_and_privacy.change_password.warning_changing_pws_will_log_you_out': return 'Changer le mot de passe vous déconnectera de l\'application.';
			case 'habits.title': return 'Habitudes';
			case 'habits.no_habits': return 'Aucune habitude';
			case 'habits.get_started_now': return 'Ajoutez votre première habitude pour commencer !';
			case 'habits.delete_habit.title': return 'Supprimer l\'habitude';
			case 'habits.delete_habit.description': return 'Êtes-vous sûr de vouloir supprimer cette habitude ?';
			case 'habits.delete_habit.warning': return 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.';
			case 'habits.add.title': return 'Que souhaitez-vous accomplir ?';
			case 'habits.add.name': return 'Nom de l\'habitude*';
			case 'habits.add.name_hint': return 'Boire de l\'eau';
			case 'habits.add.name_description': return 'Définissez un nom pour votre habitude, cela sera affiché dans le tableau de bord et dans les notifications.';
			case 'habits.add.name_required': return 'Le nom de l\'habitude est requis';
			case 'habits.add.citation': return 'Citation';
			case 'habits.add.citation_description': return 'Ajoutez une citation à votre habitude, cela vous aidera à vous souvenir de la raison pour laquelle vous la suivez et vous motivera.';
			case 'habits.add.citation_hint': return '“L\'eau est la seule boisson d\'un homme sage.” - Henry David Thoreau';
			case 'habits.add.start_date': return 'Date de début';
			case 'habits.add.end_date': return 'Date de fin';
			case 'habits.add.when_would_you_like_the_habit_to_start': return 'Quand aimeriez-vous que l\'habitude commence ?';
			case 'habits.add.when_would_you_like_the_habit_to_end': return 'Quand aimeriez-vous que l\'habitude se termine ?';
			case 'habits.add.no_date_selected': return 'Pas de date sélectionnée';
			case 'habits.add.frequency_label': return 'Fréquence';
			case 'habits.add.frequency.daily': return 'Journalier';
			case 'habits.add.frequency.weekly': return 'Hebdomadaire';
			case 'habits.add.frequency.monthly': return 'Mensuel';
			case 'habits.add.frequency.repeatition': return 'Répétition';
			case 'habits.add.number_of_times_label': return 'Nombre de fois';
			case 'habits.add.number_of_times_description': return 'Combien de fois voulez-vous faire cette habitude ?\nSera réinitialisé à chaque fois que la fréquence est atteinte (par exemple, si vous le réglez sur 3 fois et une fréquence quotidienne, vous devrez le faire 3 fois par jour)..';
			case 'habits.add.days_of_week_label': return 'Jours de la semaine';
			case 'habits.add.days_of_week_description': return 'Quels jours de la semaine souhaitez-vous suivre cette habitude ?';
			case 'habits.add.search_emoji_hint': return 'Rechercher un emoji';
			case 'habits.add.reminders_label': return 'Rappels';
			case 'habits.add.reminders_description': return 'Fixez une heure pour vos rappels. Vous serez averti lorsque l\'heure sera atteinte.';
			case 'habits.add.reminders_add': return 'Ajouter un rappel';
			case 'habits.add.duration_label': return 'Durée';
			case 'habits.add.duration_description': return 'Combien de temps dure cette habitude ?';
			case 'habits.add.duration_hint': return '5 minutes';
			case 'habits.add.name_too_short': return 'Le nom de l\'habitude doit contenir au moins 4 caractères';
			case 'habits.add.days_of_week_mismatch': return 'Vous devez sélectionner autant de jours que le nombre de fois que vous avez défini';
			case 'habits.add.every_number_day_title': return 'Interval de répétition';
			case 'habits.add.every_number_day_description': return 'Combien de jours entre chaque répétition ?';
			case 'habits.add.days_of_month_title': return 'Jours du mois';
			case 'habits.add.days_of_month_description': return 'Quels jours du mois souhaitez-vous suivre cette habitude ?';
			case 'habits.add.select_days': return 'Sélectionner les jours';
			case 'habits.list': return 'Habitudes';
			case 'habits.overview': return 'Vue d\'ensemble';
			case 'habits.times_a_day': return ({required Object nb}) => '${nb} fois par jour';
			case 'habits.times_a_week': return ({required Object nb}) => '${nb} fois par semaine';
			case 'habits.times_a_month': return ({required Object nb}) => '${nb} fois par mois';
			case 'habits.habit_detail.no_citation': return 'Pas de citation';
			case 'habits.habit_detail.no_end_date': return 'Pas de date de fin';
			case 'habits.habit_detail.delete_habit': return 'Supprimer l\'habitude';
			case 'habits.habit_detail.delete_habit_description': return 'Êtes-vous sûr de vouloir supprimer cette habitude ?';
			case 'habits.habit_detail.delete_habit_warning': return 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.';
			case 'habits.habit_detail.entries': return 'Historique';
			case 'habits.habit_detail.no_entries': return 'Pas d\'entrées pour le moment';
			case 'habits.habit_detail.delete_entry': return 'Supprimer l\'entrée';
			case 'habits.habit_detail.delete_entry_description': return 'Êtes-vous sûr de vouloir supprimer cette entrée ?';
			case 'habits.habit_detail.delete_entry_warning': return 'Cette action est irréversible.';
			case 'under_construction.title': return 'On travaille dessus !';
			case 'under_construction.description': return 'Cette fonctionnalité est en cours de développement.\n\nRevenez bientôt pour découvrir les dernières mises à jour !';
			case 'more.title': return 'Plus';
			case 'days_of_week.monday': return 'Lundi';
			case 'days_of_week.tuesday': return 'Mardi';
			case 'days_of_week.wednesday': return 'Mercredi';
			case 'days_of_week.thursday': return 'Jeudi';
			case 'days_of_week.friday': return 'Vendredi';
			case 'days_of_week.saturday': return 'Samedi';
			case 'days_of_week.sunday': return 'Dimanche';
			case 'times.today': return 'Aujourd\'hui';
			case 'times.tomorrow': return 'Demain';
			case 'times.yesterday': return 'Hier';
			case 'times.this_week': return 'Cette semaine';
			case 'times.last_week': return 'La semaine dernière';
			case 'times.this_month': return 'Ce mois-ci';
			case 'times.last_month': return 'Le mois dernier';
			case 'times.this_year': return 'Cette année';
			case 'times.last_year': return 'L\'année dernière';
			case 'times.all_time': return 'Tout le temps';
			case 'times.minutes': return ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: '${nb} minutes',
				one: '${nb} minute',
				other: '${nb} minutes',
			);
			case 'days_before.none.value': return '0';
			case 'days_before.none.label': return 'Aucun';
			case 'days_before.same_day.value': return '0';
			case 'days_before.same_day.label': return 'Le même jour';
			case 'days_before.one_day.value': return '-1';
			case 'days_before.one_day.label': return '1 jour avant';
			case 'days_before.two_days.value': return '-2';
			case 'days_before.two_days.label': return '2 jours avant';
			case 'days_before.three_days.value': return '-3';
			case 'days_before.three_days.label': return '3 jours avant';
			case 'days_before.one_week.value': return '-7';
			case 'days_before.one_week.label': return '1 semaine avant';
			case 'days_before.custom.value': return 'null';
			case 'days_before.custom.label': return 'Personnalisé';
			case 'time_before.same_time.value': return '0';
			case 'time_before.same_time.label': return 'Au même moment';
			case 'time_before.five_minutes.value': return '-5';
			case 'time_before.five_minutes.label': return '5 minutes avant';
			case 'time_before.fifteen_minutes.value': return '-15';
			case 'time_before.fifteen_minutes.label': return '15 minutes avant';
			case 'time_before.thirty_minutes.value': return '-30';
			case 'time_before.thirty_minutes.label': return '30 minutes avant';
			case 'time_before.one_hour.value': return '-60';
			case 'time_before.one_hour.label': return '1 heure avant';
			case 'time_before.two_hours.value': return '-120';
			case 'time_before.two_hours.label': return '2 heures avant';
			case 'time_before.one_day.value': return '-1440';
			case 'time_before.one_day.label': return '1 jour avant';
			case 'time_before.custom.value': return 'null';
			case 'time_before.custom.label': return 'Personnalisé';
			case 'actions.save': return 'Enregistrer';
			case 'actions.cancel': return 'Annuler';
			case 'actions.next': return 'Suivant';
			case 'actions.back': return 'Retour';
			case 'actions.delete': return 'Supprimer';
			case 'actions.add': return 'Ajouter';
			case 'actions.edit': return 'Modifier';
			case 'actions.clear': return 'Effacer';
			case 'actions.close': return 'Fermer';
			case 'actions.subscribe': return 'S\'abonner';
			case 'date_modes.date': return 'Date';
			case 'date_modes.duration': return 'Durée';
			case 'loading.simple': return 'Chargement en cours...';
			case 'validation.required': return 'Ce champ est obligatoire';
			case 'validation.invalid_url': return 'URL invalide';
			case 'errors.wrong_email_password': return 'Adresse e-mail ou mot de passe incorrect';
			case 'errors.email_malformed': return 'Adresse e-mail invalide';
			case 'errors.unknown_error': return 'Une erreur inconnue s\'est produite';
			case 'notifications.task_due_now': return 'La tâche est due maintenant';
			case 'notifications.task_starting': return 'La tâche commence maintenant';
			case 'notifications.task_starting_in': return ({required Object time}) => 'La tâche commence dans ${time}';
			case 'notifications.habit_due_now': return 'Effectuez votre habitude maintenant, une chose en moins à faire !';
			case 'time_units.short.day': return 'j';
			case 'time_units.short.hour': return 'h';
			case 'time_units.short.minute': return 'm';
			case 'time_units.long.day': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'jour',
				one: 'jour',
				other: 'jours',
			);
			case 'time_units.long.hour': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'heure',
				one: 'heure',
				other: 'heures',
			);
			case 'time_units.long.minute': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'minute',
				one: 'minute',
				other: 'minutes',
			);
			case 'name_generator.animals.0': return 'hibou';
			case 'name_generator.animals.1': return 'renard';
			case 'name_generator.animals.2': return 'lapin';
			case 'name_generator.animals.3': return 'loutre';
			case 'name_generator.animals.4': return 'pingouin';
			case 'name_generator.animals.5': return 'panda';
			case 'name_generator.animals.6': return 'écureuil';
			case 'name_generator.animals.7': return 'koala';
			case 'name_generator.animals.8': return 'tigre';
			case 'name_generator.animals.9': return 'girafe';
			case 'name_generator.animals.10': return 'singe';
			case 'name_generator.animals.11': return 'raton-laveur';
			case 'name_generator.animals.12': return 'zèbre';
			case 'name_generator.animals.13': return 'kangourou';
			case 'name_generator.animals.14': return 'perroquet';
			case 'name_generator.animals.15': return 'dauphin';
			case 'name_generator.animals.16': return 'paresseux';
			case 'name_generator.animals.17': return 'loup';
			case 'name_generator.animals.18': return 'lion';
			case 'name_generator.animals.19': return 'ours';
			case 'name_generator.animals.20': return 'aigle';
			case 'name_generator.animals.21': return 'éléphant';
			case 'name_generator.animals.22': return 'léopard';
			case 'name_generator.animals.23': return 'guépard';
			case 'name_generator.animals.24': return 'hippopotame';
			case 'name_generator.animals.25': return 'lemurien';
			case 'name_generator.animals.26': return 'grenouille';
			case 'name_generator.animals.27': return 'caméléon';
			case 'name_generator.animals.28': return 'lynx';
			case 'name_generator.animals.29': return 'macareux';
			case 'name_generator.animals.30': return 'phoque';
			case 'name_generator.animals.31': return 'faucon';
			case 'name_generator.animals.32': return 'orque';
			case 'name_generator.animals.33': return 'suricate';
			case 'name_generator.animals.34': return 'hérisson';
			case 'name_generator.animals.35': return 'belette';
			case 'name_generator.animals.36': return 'tatou';
			case 'name_generator.animals.37': return 'wombat';
			case 'name_generator.animals.38': return 'ornithorynque';
			case 'name_generator.animals.39': return 'blaireau';
			case 'name_generator.animals.40': return 'yak';
			case 'name_generator.animals.41': return 'lézard';
			case 'name_generator.animals.42': return 'scarabée';
			case 'name_generator.animals.43': return 'chenille';
			case 'name_generator.animals.44': return 'jaguar';
			case 'name_generator.animals.45': return 'buffle';
			case 'name_generator.animals.46': return 'raie';
			case 'name_generator.animals.47': return 'taupe';
			case 'name_generator.animals.48': return 'âne';
			case 'name_generator.animals.49': return 'toucan';
			case 'name_generator.animals.50': return 'flamant';
			case 'name_generator.animals.51': return 'chèvre';
			case 'name_generator.animals.52': return 'alpaga';
			case 'name_generator.animals.53': return 'orignal';
			case 'name_generator.animals.54': return 'paon';
			case 'name_generator.animals.55': return 'rhinocéros';
			case 'name_generator.animals.56': return 'gecko';
			case 'name_generator.animals.57': return 'dinde';
			case 'name_generator.animals.58': return 'hamster';
			case 'name_generator.animals.59': return 'loutre';
			case 'name_generator.animals.60': return 'gorille';
			case 'name_generator.animals.61': return 'morse';
			case 'name_generator.animals.62': return 'vautour';
			case 'name_generator.animals.63': return 'raie';
			case 'name_generator.animals.64': return 'triton';
			case 'name_generator.animals.65': return 'iguane';
			case 'name_generator.animals.66': return 'porc-épic';
			case 'name_generator.animals.67': return 'python';
			case 'name_generator.animals.68': return 'antilope';
			case 'name_generator.animals.69': return 'gibbon';
			case 'name_generator.animals.70': return 'sanglier';
			case 'name_generator.animals.71': return 'grue';
			case 'name_generator.animals.72': return 'émeu';
			case 'name_generator.animals.73': return 'pélican';
			case 'name_generator.animals.74': return 'hyène';
			case 'name_generator.animals.75': return 'héron';
			case 'name_generator.animals.76': return 'agneau';
			case 'name_generator.animals.77': return 'tortue';
			case 'name_generator.animals.78': return 'crevette';
			case 'name_generator.animals.79': return 'homard';
			case 'name_generator.animals.80': return 'papillon de nuit';
			case 'name_generator.animals.81': return 'palourde';
			case 'name_generator.animals.82': return 'poisson-globe';
			case 'name_generator.animals.83': return 'étoile de mer';
			case 'name_generator.animals.84': return 'pie-grièche';
			case 'name_generator.animals.85': return 'rouge-gorge';
			case 'name_generator.animals.86': return 'caille';
			case 'name_generator.animals.87': return 'koala';
			case 'name_generator.animals.88': return 'escargot';
			case 'name_generator.animals.89': return 'limace';
			case 'name_generator.animals.90': return 'hibou';
			case 'name_generator.animals.91': return 'vipère';
			case 'name_generator.animals.92': return 'canard';
			case 'name_generator.animals.93': return 'hirondelle';
			case 'name_generator.animals.94': return 'crabe';
			case 'name_generator.animals.95': return 'lama';
			case 'name_generator.animals.96': return 'mangouste';
			case 'name_generator.animals.97': return 'chaton';
			case 'name_generator.adjectives.0': return 'joyeux';
			case 'name_generator.adjectives.1': return 'courageux';
			case 'name_generator.adjectives.2': return 'rigolo';
			case 'name_generator.adjectives.3': return 'jovial';
			case 'name_generator.adjectives.4': return 'espiègle';
			case 'name_generator.adjectives.5': return 'brillant';
			case 'name_generator.adjectives.6': return 'farfelu';
			case 'name_generator.adjectives.7': return 'curieux';
			case 'name_generator.adjectives.8': return 'rapide';
			case 'name_generator.adjectives.9': return 'audacieux';
			case 'name_generator.adjectives.10': return 'puissant';
			case 'name_generator.adjectives.11': return 'malin';
			case 'name_generator.adjectives.12': return 'rusé';
			case 'name_generator.adjectives.13': return 'doux';
			case 'name_generator.adjectives.14': return 'pelucheux';
			case 'name_generator.adjectives.15': return 'excentrique';
			case 'name_generator.adjectives.16': return 'rebondissant';
			case 'name_generator.adjectives.17': return 'étincelant';
			case 'name_generator.adjectives.18': return 'vif';
			case 'name_generator.adjectives.19': return 'chantant';
			case 'name_generator.adjectives.20': return 'lustré';
			case 'name_generator.adjectives.21': return 'claquant';
			case 'name_generator.adjectives.22': return 'brillant';
			case 'name_generator.adjectives.23': return 'rêveur';
			case 'name_generator.adjectives.24': return 'frétillant';
			case 'name_generator.adjectives.25': return 'ensoleillé';
			case 'name_generator.adjectives.26': return 'dingue';
			case 'name_generator.adjectives.27': return 'sauvage';
			case 'name_generator.adjectives.28': return 'funky';
			case 'name_generator.adjectives.29': return 'intrépide';
			case 'name_generator.adjectives.30': return 'confortable';
			case 'name_generator.adjectives.31': return 'croquant';
			case 'name_generator.adjectives.32': return 'vivant';
			case 'name_generator.adjectives.33': return 'coquin';
			case 'name_generator.adjectives.34': return 'spirituel';
			case 'name_generator.adjectives.35': return 'dynamique';
			case 'name_generator.adjectives.36': return 'pétillant';
			case 'name_generator.adjectives.37': return 'astucieux';
			case 'name_generator.adjectives.38': return 'élégant';
			case 'name_generator.adjectives.39': return 'souriant';
			case 'name_generator.adjectives.40': return 'chanceux';
			case 'name_generator.adjectives.41': return 'plein d\'énergie';
			case 'name_generator.adjectives.42': return 'chouette';
			case 'name_generator.adjectives.43': return 'soigné';
			case 'name_generator.adjectives.44': return 'frisquet';
			case 'name_generator.adjectives.45': return 'venté';
			case 'name_generator.adjectives.46': return 'gai';
			case 'name_generator.adjectives.47': return 'gracieux';
			case 'name_generator.adjectives.48': return 'courageux';
			case 'name_generator.adjectives.49': return 'étourdi';
			case 'name_generator.adjectives.50': return 'agile';
			case 'name_generator.adjectives.51': return 'fantasque';
			case 'name_generator.adjectives.52': return 'habile';
			case 'name_generator.adjectives.53': return 'chanteur';
			case 'name_generator.adjectives.54': return 'sautillant';
			case 'name_generator.adjectives.55': return 'bizarre';
			case 'name_generator.adjectives.56': return 'épicé';
			case 'name_generator.adjectives.57': return 'énergique';
			case 'name_generator.adjectives.58': return 'rapide';
			case 'name_generator.adjectives.59': return 'pratique';
			case 'name_generator.adjectives.60': return 'vacillant';
			case 'name_generator.adjectives.61': return 'croustillant';
			case 'name_generator.adjectives.62': return 'grognon';
			case 'name_generator.adjectives.63': return 'chic';
			case 'name_generator.adjectives.64': return 'plein d\'entrain';
			case 'name_generator.adjectives.65': return 'bouillonnant';
			case 'name_generator.adjectives.66': return 'éclaboussant';
			case 'name_generator.adjectives.67': return 'venté';
			case 'name_generator.adjectives.68': return 'rebondissant';
			case 'name_generator.adjectives.69': return 'étincelant';
			case 'name_generator.adjectives.70': return 'joyeux';
			case 'name_generator.adjectives.71': return 'moelleux';
			case 'name_generator.adjectives.72': return 'loufoque';
			case 'name_generator.adjectives.73': return 'vivifiant';
			case 'name_generator.adjectives.74': return 'claquant';
			case 'name_generator.adjectives.75': return 'joyeux';
			case 'name_generator.adjectives.76': return 'plumé';
			case 'name_generator.adjectives.77': return 'piquant';
			case 'name_generator.adjectives.78': return 'rapide';
			case 'name_generator.adjectives.79': return 'vif';
			case 'name_generator.adjectives.80': return 'moustachu';
			case 'name_generator.adjectives.81': return 'tacheté';
			case 'name_generator.adjectives.82': return 'rayé';
			case 'name_generator.adjectives.83': return 'fougueux';
			case 'name_generator.adjectives.84': return 'bavard';
			case 'name_generator.adjectives.85': return 'distingué';
			case 'name_generator.adjectives.86': return 'serpentin';
			case 'name_generator.adjectives.87': return 'rigolo';
			case 'name_generator.adjectives.88': return 'élégant';
			case 'name_generator.adjectives.89': return 'sautillant';
			case 'name_generator.adjectives.90': return 'dynamique';
			case 'name_generator.adjectives.91': return 'skippy';
			case 'name_generator.adjectives.92': return 'duveteux';
			case 'name_generator.adjectives.93': return 'rondelet';
			case 'name_generator.adjectives.94': return 'gonflé';
			case 'name_generator.adjectives.95': return 'déjanté';
			case 'name_generator.adjectives.96': return 'rose';
			case 'name_generator.adjectives.97': return 'exubérant';
			case 'name_generator.adjectives.98': return 'raffiné';
			case 'eisenhower.small_title': return 'Eisenhower';
			case 'eisenhower.title': return 'Matrice d\'Eisenhower';
			case 'feature_under_construction.title': return 'Fonctionnalité en construction';
			case 'feature_under_construction.description': return 'Cette fonctionnalité n\'est pas encore disponible, mais nous travaillons dur pour vous l\'apporter bientôt.\n\nRestez à l\'écoute !';
			case 'inbox.title': return 'Boîte de réception';
			case 'timer.title': return 'Minuteur';
			case 'timer.start': return 'Démarrer';
			case 'timer.stop': return 'Arrêter';
			case 'timer.reset': return 'Réinitialiser';
			case 'timer.start_pomodoro': return 'Démarrer Pomodoro';
			case 'timer.start_stopwatch': return 'Démarrer Chronomètre';
			case 'timer.start_break': return 'Démarrer une pause';
			case 'timer.pomo_running': return 'Pomodoro en cours';
			case 'timer.timer_running': return 'Timer en cours';
			case 'timer.time_left': return ({required Object timeLeft}) => 'Temps restant : ${timeLeft}';
			case 'timer.pause': return 'Pause';
			case 'timer.resume': return 'Reprendre';
			case 'timer.duration': return 'Durée';
			case 'timer.elapsed_time': return 'Temps écoulé';
			case 'timer.remaining_time': return 'Temps restant';
			case 'timer.no_timer_running': return 'Aucun minuteur en cours';
			case 'timer.modes.pomodoro': return 'Pomodoro';
			case 'timer.modes.stopwatch': return 'Chronomètre';
			case 'timer.select_task': return 'Sélectionner une tâche';
			case 'timer.select_task_to_start_timer': return 'Sélectionner une tâche pour démarrer le minuteur';
			case 'timer.completed': return 'Terminé !';
			case 'timer.pomodoro_completed_message': return 'Votre session pomodoro est terminée ! C\'est l\'heure de faire une pause.';
			case 'timer.stopwatch_completed_message': return 'Votre session de chronomètre a été terminée.';
			case 'timer.task_label': return 'Tâche';
			case 'paywall.title': return 'Obtenez AtomicBlend Cloud';
			case 'paywall.subtitle': return 'Profitez d\'Atomic Blend sans restrictions et aidez l\'initiative open source.';
			case 'paywall.advantages.all_apps_of_the_suite.title': return 'Toutes les applications de la suite';
			case 'paywall.advantages.all_apps_of_the_suite.description': return 'Accédez à toutes les applications de la suite, y compris Tâches, Habitudes, Calendrier, Notes, et plus encore.';
			case 'paywall.advantages.end_to_end_encrypted.title': return 'Chiffrement de bout en bout';
			case 'paywall.advantages.end_to_end_encrypted.description': return 'Vos données sont à vous, pour toujours.';
			case 'paywall.advantages.unlimited_tasks.title': return 'Tâches Illimitées';
			case 'paywall.advantages.unlimited_tasks.description': return 'Créez autant de tâches que vous le souhaitez, sans limites.';
			case 'paywall.advantages.unlimited_habits.title': return 'Habitudes Illimitées';
			case 'paywall.advantages.unlimited_habits.description': return 'Faites un pas vers une vie plus saine avec des habitudes illimitées.';
			case 'paywall.advantages.unlimited_tags.title': return 'Tags / Dossiers Illimités';
			case 'paywall.advantages.unlimited_tags.description': return 'Utilisez autant de tags et de dossiers que nécessaire pour organiser votre vie.';
			case 'paywall.advantages.sync_across_devices.title': return 'Synchronisation entre appareils';
			case 'paywall.advantages.sync_across_devices.description': return 'Accédez à vos données depuis n\'importe quel appareil, n\'importe où.';
			case 'paywall.advantages.community_backed.title': return 'Soutien de la communauté';
			case 'paywall.advantages.community_backed.description': return '100% opensource : rejoignez une communauté d\'utilisateurs qui soutiennent le projet.';
			case 'paywall.pricing.\$rc_annual.title': return 'Annuel';
			case 'paywall.pricing.\$rc_annual.price': return '3.33€/mo';
			case 'paywall.pricing.\$rc_annual.billed': return 'facturé à 39.99€/an';
			case 'paywall.pricing.\$rc_annual.discount': return '16% off';
			case 'paywall.pricing.\$rc_monthly.title': return 'Mensuel';
			case 'paywall.pricing.\$rc_monthly.price': return '3.99€/mo';
			case 'paywall.pricing.\$rc_monthly.billed': return 'facturé à 3.99€/mois';
			case 'paywall.pricing.\$rc_monthly.discount': return '';
			case 'paywall.no_package_selected': return 'Aucun package sélectionné';
			case 'paywall.purchase_failed': return 'Échec de l\'achat';
			case 'paywall.restore_purchase': return 'Restaurer l\'achat';
			case 'paywall.terms': return 'Conditions d\'utilisation';
			case 'paywall.privacy_policy': return 'Politique de confidentialité';
			case 'paywall.success': return 'Achat réussi !';
			case 'paywall.payment_in_progress': return 'Paiement en cours';
			case 'paywall.payment_in_progress_description': return 'Veuillez patienter pendant que nous traitons votre paiement.';
			case 'paywall.validation_failed': return 'Échec de la validation';
			case 'paywall.validation_failed_description': return 'Veuillez vérifier votre connexion Internet et redémarrer l\'application.';
			case 'paywall.mobile_app_required': return 'Application mobile requise';
			case 'paywall.payment_on_mobile_for_better_xp': return 'Pour vous offrir la meilleure expérience possible, le paiement et la configuration du compte ne sont disponibles que sur l\'application mobile.';
			case 'paywall.ios': return 'iOS';
			case 'paywall.android': return 'Android';
			case 'search.results': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucun résultat trouvé',
				one: '1 résultat trouvé',
				other: '${n} résultats trouvés',
			);
			default: return null;
		}
	}
}

