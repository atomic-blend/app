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
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	@override String get app_name => 'Atomic Blend';
	@override late final _TranslationsNavigationFr navigation = _TranslationsNavigationFr._(_root);
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsTodayFr today = _TranslationsTodayFr._(_root);
	@override late final _TranslationsCalendarFr calendar = _TranslationsCalendarFr._(_root);
	@override late final _TranslationsHabitsFr habits = _TranslationsHabitsFr._(_root);
	@override late final _TranslationsTasksFr tasks = _TranslationsTasksFr._(_root);
	@override late final _TranslationsMoreFr more = _TranslationsMoreFr._(_root);
	@override late final _TranslationsTimesFr times = _TranslationsTimesFr._(_root);
	@override late final _TranslationsActionsFr actions = _TranslationsActionsFr._(_root);
	@override late final _TranslationsValidationFr validation = _TranslationsValidationFr._(_root);
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

// Path: today
class _TranslationsTodayFr implements TranslationsTodayEn {
	_TranslationsTodayFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Aujourd\'hui';
	@override String get nothing_to_do => 'Rien à faire pour le moment, vous pouvez vous détendre !';
	@override String get day_off => 'Vous n\'avez rien de prévu pour demain, profitez-en !';
	@override String get week_off => 'Vous n\'avez rien de prévu pour cette semaine, essayez de prendre le temps de faire les choses laissées de côté !';
}

// Path: calendar
class _TranslationsCalendarFr implements TranslationsCalendarEn {
	_TranslationsCalendarFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Calendrier';
}

// Path: habits
class _TranslationsHabitsFr implements TranslationsHabitsEn {
	_TranslationsHabitsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Habitudes';
}

// Path: tasks
class _TranslationsTasksFr implements TranslationsTasksEn {
	_TranslationsTasksFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes tâches';
	@override String get no_tasks_for_now => 'Pas de tâches pour le moment';
	@override String get task_details => 'Détail de la tâche';
	@override late final _TranslationsTasksDueDatesFr due_dates = _TranslationsTasksDueDatesFr._(_root);
	@override late final _TranslationsTasksAddTaskModalFr add_task_modal = _TranslationsTasksAddTaskModalFr._(_root);
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
}

// Path: validation
class _TranslationsValidationFr implements TranslationsValidationEn {
	_TranslationsValidationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Ce champ est obligatoire';
	@override String get invalid_url => 'URL invalide';
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
	@override String get register => 'S\'inscrire';
	@override String get no_account => 'Pas de compte ?';
}

// Path: settings.app_settings
class _TranslationsSettingsAppSettingsFr implements TranslationsSettingsAppSettingsEn {
	_TranslationsSettingsAppSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres de l\'application';
	@override late final _TranslationsSettingsAppSettingsSelfHostedUrlFr selfHostedUrl = _TranslationsSettingsAppSettingsSelfHostedUrlFr._(_root);
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
	@override String get cancel => 'Annuler';
	@override String get save => 'Enregistrer';
	@override String get erase => 'Effacer';
	@override String get title_required => 'Titre requis';
	@override String get title_required_description => 'Veuillez saisir un titre pour votre tâche';
}

// Path: settings.app_settings.selfHostedUrl
class _TranslationsSettingsAppSettingsSelfHostedUrlFr implements TranslationsSettingsAppSettingsSelfHostedUrlEn {
	_TranslationsSettingsAppSettingsSelfHostedUrlFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL auto-hébergée';
	@override String get description => 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.';
	@override String get placeholder => 'Entrez l\'URL de votre instance auto-hébergée';
	@override String get not_set => 'Non défini';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
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
			case 'auth.register.register': return 'S\'inscrire';
			case 'auth.register.no_account': return 'Pas de compte ?';
			case 'settings.title': return 'Paramètres';
			case 'settings.app_settings.title': return 'Paramètres de l\'application';
			case 'settings.app_settings.selfHostedUrl.title': return 'URL auto-hébergée';
			case 'settings.app_settings.selfHostedUrl.description': return 'Si vous utilisez une instance auto-hébergée d\'Atomic Blend, vous pouvez saisir l\'URL ici.';
			case 'settings.app_settings.selfHostedUrl.placeholder': return 'Entrez l\'URL de votre instance auto-hébergée';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Non défini';
			case 'settings.logout': return 'Déconnexion';
			case 'today.title': return 'Aujourd\'hui';
			case 'today.nothing_to_do': return 'Rien à faire pour le moment, vous pouvez vous détendre !';
			case 'today.day_off': return 'Vous n\'avez rien de prévu pour demain, profitez-en !';
			case 'today.week_off': return 'Vous n\'avez rien de prévu pour cette semaine, essayez de prendre le temps de faire les choses laissées de côté !';
			case 'calendar.title': return 'Calendrier';
			case 'habits.title': return 'Habitudes';
			case 'tasks.title': return 'Mes tâches';
			case 'tasks.no_tasks_for_now': return 'Pas de tâches pour le moment';
			case 'tasks.task_details': return 'Détail de la tâche';
			case 'tasks.due_dates.today': return 'Aujourd\'hui';
			case 'tasks.due_dates.tomorrow': return 'Demain';
			case 'tasks.due_dates.no_due_date': return 'Pas de date d\'échéance';
			case 'tasks.add_task_modal.task_title': return 'Que devez-vous faire ?';
			case 'tasks.add_task_modal.description': return 'Description';
			case 'tasks.add_task_modal.due_date': return 'Date d\'échéance';
			case 'tasks.add_task_modal.cancel': return 'Annuler';
			case 'tasks.add_task_modal.save': return 'Enregistrer';
			case 'tasks.add_task_modal.erase': return 'Effacer';
			case 'tasks.add_task_modal.title_required': return 'Titre requis';
			case 'tasks.add_task_modal.title_required_description': return 'Veuillez saisir un titre pour votre tâche';
			case 'more.title': return 'Plus';
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
			case 'actions.save': return 'Enregistrer';
			case 'actions.cancel': return 'Annuler';
			case 'actions.next': return 'Suivant';
			case 'actions.back': return 'Retour';
			case 'validation.required': return 'Ce champ est obligatoire';
			case 'validation.invalid_url': return 'URL invalide';
			default: return null;
		}
	}
}

