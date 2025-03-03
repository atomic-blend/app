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
	@override String get app_name => 'LifeOS';
	@override late final _TranslationsAuthFr auth = _TranslationsAuthFr._(_root);
	@override late final _TranslationsSettingsFr settings = _TranslationsSettingsFr._(_root);
	@override late final _TranslationsHomeFr home = _TranslationsHomeFr._(_root);
	@override late final _TranslationsTasksFr tasks = _TranslationsTasksFr._(_root);
	@override late final _TranslationsMoreFr more = _TranslationsMoreFr._(_root);
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
	@override String get logout => 'Déconnexion';
}

// Path: home
class _TranslationsHomeFr implements TranslationsHomeEn {
	_TranslationsHomeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Accueil';
	@override String get whats_for_today => 'Quoi de prévu pour aujourd\'hui ?';
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

// Path: auth.not_logged_in
class _TranslationsAuthNotLoggedInFr implements TranslationsAuthNotLoggedInEn {
	_TranslationsAuthNotLoggedInFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Bienvenue dans LifeOS';
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
	@override String get title => 'Connectez-vous à LifeOS';
	@override String get description => 'Connectez-vous à votre compte LifeOS pour accéder à votre contenu.';
	@override String get email => 'Adresse e-mail';
	@override String get password => 'Mot de passe';
	@override String get forgot_password => 'Mot de passe oublié';
	@override String get login => 'Se connecter';
	@override String get no_account => 'Pas de compte ?';
	@override String get email_hint => 'Entrez votre adresse e-mail';
	@override String get password_hint => 'Entrez votre mot de passe';
}

// Path: auth.register
class _TranslationsAuthRegisterFr implements TranslationsAuthRegisterEn {
	_TranslationsAuthRegisterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inscrivez-vous sur LifeOS';
	@override String get description => 'Créez un compte LifeOS pour commencer dès maintenant une vie plus tranquille.';
	@override String get email => 'Adresse e-mail';
	@override String get password => 'Mot de passe';
	@override String get forgot_password => 'Mot de passe oublié';
	@override String get register => 'S\'inscrire';
	@override String get no_account => 'Pas de compte ?';
	@override String get email_hint => 'Entrez votre adresse e-mail';
	@override String get password_hint => 'Entrez votre mot de passe';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'LifeOS';
			case 'auth.not_logged_in.welcome': return 'Bienvenue dans LifeOS';
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
			case 'auth.login.title': return 'Connectez-vous à LifeOS';
			case 'auth.login.description': return 'Connectez-vous à votre compte LifeOS pour accéder à votre contenu.';
			case 'auth.login.email': return 'Adresse e-mail';
			case 'auth.login.password': return 'Mot de passe';
			case 'auth.login.forgot_password': return 'Mot de passe oublié';
			case 'auth.login.login': return 'Se connecter';
			case 'auth.login.no_account': return 'Pas de compte ?';
			case 'auth.login.email_hint': return 'Entrez votre adresse e-mail';
			case 'auth.login.password_hint': return 'Entrez votre mot de passe';
			case 'auth.register.title': return 'Inscrivez-vous sur LifeOS';
			case 'auth.register.description': return 'Créez un compte LifeOS pour commencer dès maintenant une vie plus tranquille.';
			case 'auth.register.email': return 'Adresse e-mail';
			case 'auth.register.password': return 'Mot de passe';
			case 'auth.register.forgot_password': return 'Mot de passe oublié';
			case 'auth.register.register': return 'S\'inscrire';
			case 'auth.register.no_account': return 'Pas de compte ?';
			case 'auth.register.email_hint': return 'Entrez votre adresse e-mail';
			case 'auth.register.password_hint': return 'Entrez votre mot de passe';
			case 'settings.title': return 'Paramètres';
			case 'settings.logout': return 'Déconnexion';
			case 'home.title': return 'Accueil';
			case 'home.whats_for_today': return 'Quoi de prévu pour aujourd\'hui ?';
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
			default: return null;
		}
	}
}

