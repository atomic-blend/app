///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr with BaseTranslations<AppLocale, Translations> implements Translations {
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
	@override late final _TranslationsActionsFr actions = _TranslationsActionsFr._(_root);
	@override Map<String, String> get date_modes => {
		'date': 'Date',
		'duration': 'Durée',
	};
	@override Map<String, String> get errors => {
		'wrong_email_password': 'Adresse e-mail ou mot de passe incorrect',
		'email_malformed': 'Adresse e-mail invalide',
		'unknown_error': 'Une erreur inconnue s\'est produite',
	};
	@override late final _TranslationsNotificationsFr notifications = _TranslationsNotificationsFr._(_root);
	@override late final _TranslationsTimeUnitsFr time_units = _TranslationsTimeUnitsFr._(_root);
	@override late final _TranslationsEisenhowerFr eisenhower = _TranslationsEisenhowerFr._(_root);
	@override late final _TranslationsInboxFr inbox = _TranslationsInboxFr._(_root);
	@override late final _TranslationsTimerFr timer = _TranslationsTimerFr._(_root);
	@override late final _TranslationsSearchFr search = _TranslationsSearchFr._(_root);
	@override late final _TranslationsSyncFr sync = _TranslationsSyncFr._(_root);
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
	@override String get no_tasks_for_now => 'Pas de tâches pour le moment';
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
	@override late final _TranslationsTasksConflictDetectedModalFr conflict_detected_modal = _TranslationsTasksConflictDetectedModalFr._(_root);
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
	@override String get title => 'Compte';
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
	@override String get this_week => 'Cette semaine';
	@override String minutes({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: '${nb} minutes',
		one: '${nb} minute',
		other: '${nb} minutes',
	);
}

// Path: actions
class _TranslationsActionsFr implements TranslationsActionsEn {
	_TranslationsActionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get save => 'Enregistrer';
	@override String get cancel => 'Annuler';
	@override String get delete => 'Supprimer';
	@override String get add => 'Ajouter';
	@override String get edit => 'Modifier';
	@override String get clear => 'Effacer';
	@override String get close => 'Fermer';
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

// Path: eisenhower
class _TranslationsEisenhowerFr implements TranslationsEisenhowerEn {
	_TranslationsEisenhowerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get small_title => 'Eisenhower';
	@override String get title => 'Matrice d\'Eisenhower';
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
	@override String get start_pomodoro => 'Démarrer Pomodoro';
	@override String get start_stopwatch => 'Démarrer Chronomètre';
	@override String get start_break => 'Démarrer une pause';
	@override String get pomo_running => 'Pomodoro en cours';
	@override String get timer_running => 'Timer en cours';
	@override String time_left({required Object timeLeft}) => 'Temps restant : ${timeLeft}';
	@override String get pause => 'Pause';
	@override String get duration => 'Durée';
	@override String get elapsed_time => 'Temps écoulé';
	@override Map<String, String> get modes => {
		'pomodoro': 'Pomodoro',
		'stopwatch': 'Chronomètre',
	};
	@override String get select_task => 'Sélectionner une tâche';
	@override String get completed => 'Terminé !';
	@override String get pomodoro_completed_message => 'Votre session pomodoro est terminée ! C\'est l\'heure de faire une pause.';
	@override String get stopwatch_completed_message => 'Votre session de chronomètre a été terminée.';
	@override String get task_label => 'Tâche';
}

// Path: search
class _TranslationsSearchFr implements TranslationsSearchEn {
	_TranslationsSearchFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recherche';
	@override String results({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Aucun résultat trouvé',
		one: '1 résultat trouvé',
		other: '${n} résultats trouvés',
	);
}

// Path: sync
class _TranslationsSyncFr implements TranslationsSyncEn {
	_TranslationsSyncFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Synchronisation';
	@override String get status => 'État';
	@override String get loading => 'Chargement...';
	@override String get up_to_date => 'À jour';
	@override String get conflicts => 'Conflits';
	@override String x_items_have_conflicts({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Aucun élément n\'a de conflits',
		one: '1 élément a des conflits',
		other: '${n} éléments ont des conflits',
	);
	@override late final _TranslationsSyncDetailsFr details = _TranslationsSyncDetailsFr._(_root);
	@override String get sync_now => 'Synchroniser maintenant';
	@override late final _TranslationsSyncConflictResolverFr conflict_resolver = _TranslationsSyncConflictResolverFr._(_root);
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
}

// Path: tasks.conflict_detected_modal
class _TranslationsTasksConflictDetectedModalFr implements TranslationsTasksConflictDetectedModalEn {
	_TranslationsTasksConflictDetectedModalFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conflit détecté';
	@override String get description => 'Les modifications précédentes de cette tâche effectuées hors ligne entrent en conflit avec la version actuelle de la tâche.';
	@override String get warning => 'Vous pouvez soit résoudre les conflits maintenant, soit revenir plus tard pour les résoudre.';
	@override String get resolve_now => 'Résoudre';
	@override String get later => 'Plus tard';
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
}

// Path: calendar.settings
class _TranslationsCalendarSettingsFr implements TranslationsCalendarSettingsEn {
	_TranslationsCalendarSettingsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres du calendrier';
	@override String get display_habits => 'Afficher les habitudes';
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

// Path: sync.details
class _TranslationsSyncDetailsFr implements TranslationsSyncDetailsEn {
	_TranslationsSyncDetailsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Détails';
	@override String get tasks => 'Tâches';
	@override String task_items({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
		zero: 'Aucune tâche',
		one: '1 tâche',
		other: '${n} tâches',
	);
}

// Path: sync.conflict_resolver
class _TranslationsSyncConflictResolverFr implements TranslationsSyncConflictResolverEn {
	_TranslationsSyncConflictResolverFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Résolveur de Conflits';
	@override String get choose_between => 'Choisissez entre accepter ou refuser les modifications';
	@override String get refuse => 'Refuser';
	@override String get accept => 'Accepter';
	@override String get in_app_version => 'Dans l\'application';
	@override String get apply_to_all => 'Appliquer la décision à tous les conflits';
	@override String get changes_to_apply => 'Modifications à appliquer';
	@override Map<String, dynamic> get fields => {
		'title': 'Titre',
		'end_date': 'Date de fin',
		'description': 'Notes',
		'undefined': 'Non défini',
		'start_date': 'Date de début',
		'reminders_title': 'Rappels',
		'reminders': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
			zero: 'Aucun rappel',
			one: '1 rappel',
			other: '${n} rappels',
		),
		'priority': 'Priorité',
		'folder': 'Dossier',
		'tags': ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
			zero: 'Aucun tag',
			one: '1 tag',
			other: '${n} tags',
		),
	};
	@override String get progress => 'Progression';
}

// Path: settings.app_settings.selfHostedUrl
class _TranslationsSettingsAppSettingsSelfHostedUrlFr implements TranslationsSettingsAppSettingsSelfHostedUrlEn {
	_TranslationsSettingsAppSettingsSelfHostedUrlFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'URL auto-hébergée';
	@override String get not_set => 'Non défini';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app_name' => 'Atomic Blend',
			'app_name_saas' => 'Atomic Blend Cloud',
			'settings.title' => 'Paramètres',
			'settings.app_settings.title' => 'Paramètres de l\'application',
			'settings.app_settings.selfHostedUrl.title' => 'URL auto-hébergée',
			'settings.app_settings.selfHostedUrl.not_set' => 'Non défini',
			'settings.logout' => 'Déconnexion',
			'tags.title' => 'Tags',
			'tags.assign_tags' => 'Assigner des tags',
			'tags.add_modal.title' => 'Ajouter un nouveau tag',
			'tags.add_modal.edit_title' => 'Modifier le tag',
			'tags.add_modal.name' => 'Nom du tag',
			'tags.add_modal.name_hint' => 'Travail',
			'tags.add_modal.name_description' => 'Définissez un nom pour votre tag, cela sera affiché dans le tableau de bord et dans les notifications.',
			'tags.add_modal.name_required' => 'Le nom du tag est requis',
			'tags.add_modal.color' => 'Couleur du tag',
			'tags.add_modal.color_description' => 'Choisissez une couleur pour votre tag, cela vous aidera à le distinguer des autres.',
			'tags.delete.title' => 'Supprimer le tag',
			'tags.delete.description' => 'Êtes-vous sûr de vouloir supprimer ce tag ?',
			'tags.delete.warning' => 'Cette action est irréversible et le tag sera supprimé de tous les éléments associés.',
			'tasks.title' => 'Tâches',
			'tasks.today' => 'Aujourd\'hui',
			'tasks.tags' => 'Tags',
			'tasks.inbox' => 'Boîte de réception',
			'tasks.all_tasks' => 'Toutes les tâches',
			'tasks.completed_tasks' => 'Tâches terminées',
			'tasks.my_tags' => 'Mes tags',
			'tasks.no_tags_for_now' => 'Pas de tags pour le moment',
			'tasks.my_folders' => 'Mes dossiers',
			'tasks.folders.title' => 'Dossiers',
			'tasks.folders.no_folders' => 'Aucun dossier',
			'tasks.folders.add_folder' => 'Ajouter un dossier',
			'tasks.folders.edit_folder' => 'Modifier le dossier',
			'tasks.folders.delete_folder' => 'Supprimer le dossier',
			'tasks.folders.delete_folder_description' => 'Êtes-vous sûr de vouloir supprimer ce dossier ?',
			'tasks.folders.delete_folder_warning' => 'Cette action est irréversible et toutes les tâches associées à ce dossier seront déliées.',
			'tasks.folders.name' => 'Nom du dossier',
			'tasks.folders.name_hint' => 'Travail',
			'tasks.folders.name_description' => 'Définissez un nom pour votre dossier, cela sera affiché dans le tableau de bord et dans les notifications.',
			'tasks.folders.name_required' => 'Nom requis',
			'tasks.folders.color' => 'Couleur du dossier',
			'tasks.folders.color_description' => 'Choisissez une couleur pour votre dossier, cela vous aidera à le distinguer des autres.',
			'tasks.folders.select_a_folder' => 'Sélectionner un dossier',
			'tasks.overview' => 'Vue d\'ensemble',
			'tasks.nothing_to_do' => 'Rien à faire pour le moment, vous pouvez vous détendre !',
			'tasks.day_off' => 'Vous n\'avez rien de prévu pour demain, profitez-en !',
			'tasks.no_tasks_for_now' => 'Pas de tâches pour le moment',
			'tasks.time_log' => 'Journal',
			'tasks.log_session' => 'Journaliser une session',
			'tasks.timer' => 'Chronomètre',
			'tasks.pomodoro' => 'Pomodoro',
			'tasks.manual' => 'Manuel',
			'tasks.from' => 'De',
			'tasks.to' => 'À',
			'tasks.priority' => 'Priorité',
			'tasks.priorities.none' => 'Aucune',
			'tasks.priorities.low' => 'Faible',
			'tasks.priorities.medium' => 'Moyenne',
			'tasks.priorities.high' => 'Haute',
			'tasks.due_dates.today' => 'Aujourd\'hui',
			'tasks.due_dates.tomorrow' => 'Demain',
			'tasks.due_dates.no_due_date' => 'Pas de date d\'échéance',
			'tasks.add_task_modal.task_title' => 'Que devez-vous faire ?',
			'tasks.add_task_modal.description' => 'Description',
			'tasks.add_task_modal.start_date' => 'Date de début',
			'tasks.add_task_modal.dates' => 'Dates',
			'tasks.add_task_modal.notes' => 'Notes',
			'tasks.add_task_modal.end_date' => 'Date de fin',
			'tasks.add_task_modal.cancel' => 'Annuler',
			'tasks.add_task_modal.task_added' => 'Tâche ajoutée',
			'tasks.add_task_modal.task_added_description' => 'Votre tâche a été ajoutée avec succès.',
			'tasks.add_task_modal.task_error' => 'Erreur lors de l\'opération',
			'tasks.add_task_modal.save' => 'Enregistrer',
			'tasks.add_task_modal.erase' => 'Effacer',
			'tasks.add_task_modal.title_required' => 'Titre requis',
			'tasks.add_task_modal.title_required_description' => 'Veuillez saisir un titre pour votre tâche',
			'tasks.add_task_modal.reminders' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Rappel', one: 'Rappel', other: 'Rappels', ), 
			'tasks.add_task_modal.time_planned' => 'Heure prévue',
			'tasks.add_task_modal.none' => 'Aucun',
			'tasks.add_task_modal.no_reminders' => 'Pas de rappels',
			'tasks.add_task_modal.when_would_you_like_to_be_reminded' => 'Quand aimeriez-vous être rappelé ?',
			'tasks.add_task_modal.when_would_you_like_the_task_to_start' => 'Quand aimeriez-vous que la tâche commence ?',
			'tasks.add_task_modal.when_would_you_like_the_task_to_end' => 'Quand aimeriez-vous que la tâche se termine ?',
			'tasks.time_spent' => 'Temps passé',
			'tasks.no_time_entries' => 'Pas d\'entrées de temps',
			'tasks.add_time_entry.title' => 'Ajouter une entrée de temps',
			'tasks.add_time_entry.description' => 'Manually add a time entry for this task.',
			'tasks.add_time_entry.start_time' => 'Heure de début',
			'tasks.add_time_entry.end_time' => 'Heure de fin',
			'tasks.add_time_entry.not_defined' => 'Non défini',
			'tasks.conflict_detected_modal.title' => 'Conflit détecté',
			'tasks.conflict_detected_modal.description' => 'Les modifications précédentes de cette tâche effectuées hors ligne entrent en conflit avec la version actuelle de la tâche.',
			'tasks.conflict_detected_modal.warning' => 'Vous pouvez soit résoudre les conflits maintenant, soit revenir plus tard pour les résoudre.',
			'tasks.conflict_detected_modal.resolve_now' => 'Résoudre',
			'tasks.conflict_detected_modal.later' => 'Plus tard',
			'calendar.title' => 'Calendrier',
			'calendar.month' => 'Mois',
			'calendar.day' => 'Jour',
			'calendar.threeDays' => '3 jours',
			'calendar.week' => 'Semaine',
			'calendar.schedule' => 'Emploi du temps',
			'calendar.errors.cannot_move_device_calendar_event' => 'Vous ne pouvez pas déplacer un événement de calendrier d\'appareil',
			'calendar.errors.cannot_move_habit_event' => 'Vous ne pouvez pas déplacer un événement d\'habitude',
			'calendar.errors.cannot_resize_device_calendar_event' => 'Vous ne pouvez pas redimensionner un événement de calendrier d\'appareil',
			'calendar.errors.cannot_resize_habit_event' => 'Vous ne pouvez pas redimensionner un événement d\'habitude',
			'calendar.event_detail.date' => 'Date',
			'calendar.event_detail.time' => 'Heure',
			'calendar.event_detail.organizer' => 'Organisateur',
			'calendar.event_detail.reminders' => 'Rappels',
			'calendar.event_detail.details' => 'Détails',
			'calendar.event_detail.join_meeting' => 'Rejoindre la réunion',
			'calendar.event_detail.google_meet_call' => 'Appel Meet Call',
			'calendar.event_detail.zoom_meet_call' => 'Appel Zoom',
			'calendar.event_detail.ms_teams_call' => 'Appel MS Teams',
			'calendar.event_detail.join_now' => 'Rejoindre maintenant',
			'calendar.event_detail.attendee' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Participant', one: 'Participant', other: 'Participants', ), 
			'calendar.settings.title' => 'Paramètres du calendrier',
			'calendar.settings.display_habits' => 'Afficher les habitudes',
			'account.title' => 'Compte',
			'habits.title' => 'Habitudes',
			'habits.no_habits' => 'Aucune habitude',
			'habits.get_started_now' => 'Ajoutez votre première habitude pour commencer !',
			'habits.delete_habit.title' => 'Supprimer l\'habitude',
			'habits.delete_habit.description' => 'Êtes-vous sûr de vouloir supprimer cette habitude ?',
			'habits.delete_habit.warning' => 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.',
			'habits.add.title' => 'Que souhaitez-vous accomplir ?',
			'habits.add.name' => 'Nom de l\'habitude*',
			'habits.add.name_hint' => 'Boire de l\'eau',
			'habits.add.name_description' => 'Définissez un nom pour votre habitude, cela sera affiché dans le tableau de bord et dans les notifications.',
			'habits.add.name_required' => 'Le nom de l\'habitude est requis',
			'habits.add.citation' => 'Citation',
			'habits.add.citation_description' => 'Ajoutez une citation à votre habitude, cela vous aidera à vous souvenir de la raison pour laquelle vous la suivez et vous motivera.',
			'habits.add.citation_hint' => '“L\'eau est la seule boisson d\'un homme sage.” - Henry David Thoreau',
			'habits.add.start_date' => 'Date de début',
			'habits.add.end_date' => 'Date de fin',
			'habits.add.when_would_you_like_the_habit_to_start' => 'Quand aimeriez-vous que l\'habitude commence ?',
			'habits.add.when_would_you_like_the_habit_to_end' => 'Quand aimeriez-vous que l\'habitude se termine ?',
			'habits.add.no_date_selected' => 'Pas de date sélectionnée',
			'habits.add.frequency_label' => 'Fréquence',
			'habits.add.frequency.daily' => 'Journalier',
			'habits.add.frequency.weekly' => 'Hebdomadaire',
			'habits.add.frequency.monthly' => 'Mensuel',
			'habits.add.frequency.repeatition' => 'Répétition',
			'habits.add.number_of_times_label' => 'Nombre de fois',
			'habits.add.number_of_times_description' => 'Combien de fois voulez-vous faire cette habitude ?\nSera réinitialisé à chaque fois que la fréquence est atteinte (par exemple, si vous le réglez sur 3 fois et une fréquence quotidienne, vous devrez le faire 3 fois par jour)..',
			'habits.add.days_of_week_label' => 'Jours de la semaine',
			'habits.add.days_of_week_description' => 'Quels jours de la semaine souhaitez-vous suivre cette habitude ?',
			'habits.add.search_emoji_hint' => 'Rechercher un emoji',
			'habits.add.reminders_label' => 'Rappels',
			'habits.add.reminders_description' => 'Fixez une heure pour vos rappels. Vous serez averti lorsque l\'heure sera atteinte.',
			'habits.add.reminders_add' => 'Ajouter un rappel',
			'habits.add.duration_label' => 'Durée',
			'habits.add.duration_description' => 'Combien de temps dure cette habitude ?',
			'habits.add.duration_hint' => '5 minutes',
			'habits.add.days_of_week_mismatch' => 'Vous devez sélectionner autant de jours que le nombre de fois que vous avez défini',
			'habits.add.every_number_day_title' => 'Interval de répétition',
			'habits.add.every_number_day_description' => 'Combien de jours entre chaque répétition ?',
			'habits.add.days_of_month_title' => 'Jours du mois',
			'habits.add.days_of_month_description' => 'Quels jours du mois souhaitez-vous suivre cette habitude ?',
			'habits.add.select_days' => 'Sélectionner les jours',
			'habits.list' => 'Habitudes',
			'habits.overview' => 'Vue d\'ensemble',
			'habits.times_a_day' => ({required Object nb}) => '${nb} fois par jour',
			'habits.times_a_week' => ({required Object nb}) => '${nb} fois par semaine',
			'habits.times_a_month' => ({required Object nb}) => '${nb} fois par mois',
			'habits.habit_detail.no_citation' => 'Pas de citation',
			'habits.habit_detail.no_end_date' => 'Pas de date de fin',
			'habits.habit_detail.delete_habit' => 'Supprimer l\'habitude',
			'habits.habit_detail.delete_habit_description' => 'Êtes-vous sûr de vouloir supprimer cette habitude ?',
			'habits.habit_detail.delete_habit_warning' => 'Cette action est irréversible et toutes les entrées associées à l\'habitude seront supprimées.',
			'habits.habit_detail.entries' => 'Historique',
			'habits.habit_detail.no_entries' => 'Pas d\'entrées pour le moment',
			'habits.habit_detail.delete_entry' => 'Supprimer l\'entrée',
			'habits.habit_detail.delete_entry_description' => 'Êtes-vous sûr de vouloir supprimer cette entrée ?',
			'habits.habit_detail.delete_entry_warning' => 'Cette action est irréversible.',
			'under_construction.title' => 'On travaille dessus !',
			'under_construction.description' => 'Cette fonctionnalité est en cours de développement.\n\nRevenez bientôt pour découvrir les dernières mises à jour !',
			'more.title' => 'Plus',
			'days_of_week.monday' => 'Lundi',
			'days_of_week.tuesday' => 'Mardi',
			'days_of_week.wednesday' => 'Mercredi',
			'days_of_week.thursday' => 'Jeudi',
			'days_of_week.friday' => 'Vendredi',
			'days_of_week.saturday' => 'Samedi',
			'days_of_week.sunday' => 'Dimanche',
			'times.today' => 'Aujourd\'hui',
			'times.tomorrow' => 'Demain',
			'times.this_week' => 'Cette semaine',
			'times.minutes' => ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: '${nb} minutes', one: '${nb} minute', other: '${nb} minutes', ), 
			'actions.save' => 'Enregistrer',
			'actions.cancel' => 'Annuler',
			'actions.delete' => 'Supprimer',
			'actions.add' => 'Ajouter',
			'actions.edit' => 'Modifier',
			'actions.clear' => 'Effacer',
			'actions.close' => 'Fermer',
			'date_modes.date' => 'Date',
			'date_modes.duration' => 'Durée',
			'errors.wrong_email_password' => 'Adresse e-mail ou mot de passe incorrect',
			'errors.email_malformed' => 'Adresse e-mail invalide',
			'errors.unknown_error' => 'Une erreur inconnue s\'est produite',
			'notifications.task_due_now' => 'La tâche est due maintenant',
			'notifications.task_starting' => 'La tâche commence maintenant',
			'notifications.task_starting_in' => ({required Object time}) => 'La tâche commence dans ${time}',
			'notifications.habit_due_now' => 'Effectuez votre habitude maintenant, une chose en moins à faire !',
			'time_units.short.day' => 'j',
			'time_units.short.hour' => 'h',
			'time_units.short.minute' => 'm',
			'time_units.long.day' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'jour', one: 'jour', other: 'jours', ), 
			'time_units.long.hour' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'heure', one: 'heure', other: 'heures', ), 
			'time_units.long.minute' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'minute', one: 'minute', other: 'minutes', ), 
			'eisenhower.small_title' => 'Eisenhower',
			'eisenhower.title' => 'Matrice d\'Eisenhower',
			'inbox.title' => 'Boîte de réception',
			'timer.title' => 'Minuteur',
			'timer.start' => 'Démarrer',
			'timer.stop' => 'Arrêter',
			'timer.start_pomodoro' => 'Démarrer Pomodoro',
			'timer.start_stopwatch' => 'Démarrer Chronomètre',
			'timer.start_break' => 'Démarrer une pause',
			'timer.pomo_running' => 'Pomodoro en cours',
			'timer.timer_running' => 'Timer en cours',
			'timer.time_left' => ({required Object timeLeft}) => 'Temps restant : ${timeLeft}',
			'timer.pause' => 'Pause',
			'timer.duration' => 'Durée',
			'timer.elapsed_time' => 'Temps écoulé',
			'timer.modes.pomodoro' => 'Pomodoro',
			'timer.modes.stopwatch' => 'Chronomètre',
			'timer.select_task' => 'Sélectionner une tâche',
			'timer.completed' => 'Terminé !',
			'timer.pomodoro_completed_message' => 'Votre session pomodoro est terminée ! C\'est l\'heure de faire une pause.',
			'timer.stopwatch_completed_message' => 'Votre session de chronomètre a été terminée.',
			'timer.task_label' => 'Tâche',
			'search.title' => 'Recherche',
			'search.results' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Aucun résultat trouvé', one: '1 résultat trouvé', other: '${n} résultats trouvés', ), 
			'sync.title' => 'Synchronisation',
			'sync.status' => 'État',
			'sync.loading' => 'Chargement...',
			'sync.up_to_date' => 'À jour',
			'sync.conflicts' => 'Conflits',
			'sync.x_items_have_conflicts' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Aucun élément n\'a de conflits', one: '1 élément a des conflits', other: '${n} éléments ont des conflits', ), 
			'sync.details.title' => 'Détails',
			'sync.details.tasks' => 'Tâches',
			'sync.details.task_items' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Aucune tâche', one: '1 tâche', other: '${n} tâches', ), 
			'sync.sync_now' => 'Synchroniser maintenant',
			'sync.conflict_resolver.title' => 'Résolveur de Conflits',
			'sync.conflict_resolver.choose_between' => 'Choisissez entre accepter ou refuser les modifications',
			'sync.conflict_resolver.refuse' => 'Refuser',
			'sync.conflict_resolver.accept' => 'Accepter',
			'sync.conflict_resolver.in_app_version' => 'Dans l\'application',
			'sync.conflict_resolver.apply_to_all' => 'Appliquer la décision à tous les conflits',
			'sync.conflict_resolver.changes_to_apply' => 'Modifications à appliquer',
			'sync.conflict_resolver.fields.title' => 'Titre',
			'sync.conflict_resolver.fields.end_date' => 'Date de fin',
			'sync.conflict_resolver.fields.description' => 'Notes',
			'sync.conflict_resolver.fields.undefined' => 'Non défini',
			'sync.conflict_resolver.fields.start_date' => 'Date de début',
			'sync.conflict_resolver.fields.reminders_title' => 'Rappels',
			'sync.conflict_resolver.fields.reminders' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Aucun rappel', one: '1 rappel', other: '${n} rappels', ), 
			'sync.conflict_resolver.fields.priority' => 'Priorité',
			'sync.conflict_resolver.fields.folder' => 'Dossier',
			'sync.conflict_resolver.fields.tags' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n, zero: 'Aucun tag', one: '1 tag', other: '${n} tags', ), 
			'sync.conflict_resolver.progress' => 'Progression',
			_ => null,
		};
	}
}
