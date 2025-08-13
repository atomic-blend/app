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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_name': return 'Atomic Blend';
			case 'app_name_saas': return 'Atomic Blend Cloud';
			case 'settings.title': return 'Paramètres';
			case 'settings.app_settings.title': return 'Paramètres de l\'application';
			case 'settings.app_settings.selfHostedUrl.title': return 'URL auto-hébergée';
			case 'settings.app_settings.selfHostedUrl.not_set': return 'Non défini';
			case 'settings.logout': return 'Déconnexion';
			case 'tags.title': return 'Tags';
			case 'tags.assign_tags': return 'Assigner des tags';
			case 'tags.add_modal.title': return 'Ajouter un nouveau tag';
			case 'tags.add_modal.edit_title': return 'Modifier le tag';
			case 'tags.add_modal.name': return 'Nom du tag';
			case 'tags.add_modal.name_hint': return 'Travail';
			case 'tags.add_modal.name_description': return 'Définissez un nom pour votre tag, cela sera affiché dans le tableau de bord et dans les notifications.';
			case 'tags.add_modal.name_required': return 'Le nom du tag est requis';
			case 'tags.add_modal.color': return 'Couleur du tag';
			case 'tags.add_modal.color_description': return 'Choisissez une couleur pour votre tag, cela vous aidera à le distinguer des autres.';
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
			case 'tasks.no_tasks_for_now': return 'Pas de tâches pour le moment';
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
			case 'tasks.conflict_detected_modal.title': return 'Conflit détecté';
			case 'tasks.conflict_detected_modal.description': return 'Les modifications précédentes de cette tâche effectuées hors ligne entrent en conflit avec la version actuelle de la tâche.';
			case 'tasks.conflict_detected_modal.warning': return 'Vous pouvez soit résoudre les conflits maintenant, soit revenir plus tard pour les résoudre.';
			case 'tasks.conflict_detected_modal.resolve_now': return 'Résoudre';
			case 'tasks.conflict_detected_modal.later': return 'Plus tard';
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
			case 'calendar.settings.title': return 'Paramètres du calendrier';
			case 'calendar.settings.display_habits': return 'Afficher les habitudes';
			case 'account.title': return 'Compte';
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
			case 'times.this_week': return 'Cette semaine';
			case 'times.minutes': return ({required num n, required Object nb}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: '${nb} minutes',
				one: '${nb} minute',
				other: '${nb} minutes',
			);
			case 'actions.save': return 'Enregistrer';
			case 'actions.cancel': return 'Annuler';
			case 'actions.delete': return 'Supprimer';
			case 'actions.add': return 'Ajouter';
			case 'actions.edit': return 'Modifier';
			case 'actions.clear': return 'Effacer';
			case 'actions.close': return 'Fermer';
			case 'date_modes.date': return 'Date';
			case 'date_modes.duration': return 'Durée';
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
			case 'eisenhower.small_title': return 'Eisenhower';
			case 'eisenhower.title': return 'Matrice d\'Eisenhower';
			case 'inbox.title': return 'Boîte de réception';
			case 'timer.title': return 'Minuteur';
			case 'timer.start': return 'Démarrer';
			case 'timer.stop': return 'Arrêter';
			case 'timer.start_pomodoro': return 'Démarrer Pomodoro';
			case 'timer.start_stopwatch': return 'Démarrer Chronomètre';
			case 'timer.start_break': return 'Démarrer une pause';
			case 'timer.pomo_running': return 'Pomodoro en cours';
			case 'timer.timer_running': return 'Timer en cours';
			case 'timer.time_left': return ({required Object timeLeft}) => 'Temps restant : ${timeLeft}';
			case 'timer.pause': return 'Pause';
			case 'timer.duration': return 'Durée';
			case 'timer.elapsed_time': return 'Temps écoulé';
			case 'timer.modes.pomodoro': return 'Pomodoro';
			case 'timer.modes.stopwatch': return 'Chronomètre';
			case 'timer.select_task': return 'Sélectionner une tâche';
			case 'timer.completed': return 'Terminé !';
			case 'timer.pomodoro_completed_message': return 'Votre session pomodoro est terminée ! C\'est l\'heure de faire une pause.';
			case 'timer.stopwatch_completed_message': return 'Votre session de chronomètre a été terminée.';
			case 'timer.task_label': return 'Tâche';
			case 'search.results': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucun résultat trouvé',
				one: '1 résultat trouvé',
				other: '${n} résultats trouvés',
			);
			case 'sync.title': return 'Synchronisation';
			case 'sync.status': return 'État';
			case 'sync.loading': return 'Chargement...';
			case 'sync.up_to_date': return 'À jour';
			case 'sync.conflicts': return 'Conflits';
			case 'sync.x_items_have_conflicts': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucun élément n\'a de conflits',
				one: '1 élément a des conflits',
				other: '${n} éléments ont des conflits',
			);
			case 'sync.details.title': return 'Détails';
			case 'sync.details.tasks': return 'Tâches';
			case 'sync.details.task_items': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucune tâche',
				one: '1 tâche',
				other: '${n} tâches',
			);
			case 'sync.sync_now': return 'Synchroniser maintenant';
			case 'sync.conflict_resolver.title': return 'Résolveur de Conflits';
			case 'sync.conflict_resolver.choose_between': return 'Choisissez entre accepter ou refuser les modifications';
			case 'sync.conflict_resolver.refuse': return 'Refuser';
			case 'sync.conflict_resolver.accept': return 'Accepter';
			case 'sync.conflict_resolver.in_app_version': return 'Dans l\'application';
			case 'sync.conflict_resolver.apply_to_all': return 'Appliquer la décision à tous les conflits';
			case 'sync.conflict_resolver.changes_to_apply': return 'Modifications à appliquer';
			case 'sync.conflict_resolver.fields.title': return 'Titre';
			case 'sync.conflict_resolver.fields.end_date': return 'Date de fin';
			case 'sync.conflict_resolver.fields.description': return 'Notes';
			case 'sync.conflict_resolver.fields.undefined': return 'Non défini';
			case 'sync.conflict_resolver.fields.start_date': return 'Date de début';
			case 'sync.conflict_resolver.fields.reminders_title': return 'Rappels';
			case 'sync.conflict_resolver.fields.reminders': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucun rappel',
				one: '1 rappel',
				other: '${n} rappels',
			);
			case 'sync.conflict_resolver.fields.priority': return 'Priorité';
			case 'sync.conflict_resolver.fields.folder': return 'Dossier';
			case 'sync.conflict_resolver.fields.tags': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(n,
				zero: 'Aucun tag',
				one: '1 tag',
				other: '${n} tags',
			);
			case 'sync.conflict_resolver.progress': return 'Progression';
			default: return null;
		}
	}
}

