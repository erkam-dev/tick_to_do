import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, Try again later'**
  String get tryAgain;

  /// No description provided for @noTodos.
  ///
  /// In en, this message translates to:
  /// **'No Todos'**
  String get noTodos;

  /// No description provided for @noCompletedTodos.
  ///
  /// In en, this message translates to:
  /// **'No Completed Todos'**
  String get noCompletedTodos;

  /// No description provided for @newTodo.
  ///
  /// In en, this message translates to:
  /// **'New Todo'**
  String get newTodo;

  /// No description provided for @addTodo.
  ///
  /// In en, this message translates to:
  /// **'Add Todo'**
  String get addTodo;

  /// No description provided for @editTodo.
  ///
  /// In en, this message translates to:
  /// **'Edit Todo'**
  String get editTodo;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @todos.
  ///
  /// In en, this message translates to:
  /// **'Todos'**
  String get todos;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @notValid.
  ///
  /// In en, this message translates to:
  /// **'Title can not be empty'**
  String get notValid;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @snackbarDeleted.
  ///
  /// In en, this message translates to:
  /// **'Todo deleted!'**
  String get snackbarDeleted;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @markCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get markCompleted;

  /// No description provided for @markNotCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Not Completed'**
  String get markNotCompleted;

  /// No description provided for @snackbarComplete.
  ///
  /// In en, this message translates to:
  /// **'Task Marked Completed'**
  String get snackbarComplete;

  /// No description provided for @snackbarNotComplete.
  ///
  /// In en, this message translates to:
  /// **'Task Marked Not Completed'**
  String get snackbarNotComplete;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your Tick To Do account? This action is NOT REVERSIBLE! All Tick To Do data will be lost FOREVER.'**
  String get deleteAccountConfirmation;

  /// No description provided for @tips.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get tips;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @signInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign In to Continue'**
  String get signInToContinue;

  /// No description provided for @welcomeToTickToDo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Tick To Do'**
  String get welcomeToTickToDo;

  /// No description provided for @welcomeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Powerful & Elegant'**
  String get welcomeTitle1;

  /// No description provided for @welcomeTitle2.
  ///
  /// In en, this message translates to:
  /// **'Backs Up Your To-dos'**
  String get welcomeTitle2;

  /// No description provided for @welcomeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Personalized Profile'**
  String get welcomeTitle3;

  /// No description provided for @welcomeDescription1.
  ///
  /// In en, this message translates to:
  /// **'Simple and elegant to-do tracking app'**
  String get welcomeDescription1;

  /// No description provided for @welcomeDescription2.
  ///
  /// In en, this message translates to:
  /// **'Always track your tasks. Moreover, all your tasks are backed up in your Tick To Do account.'**
  String get welcomeDescription2;

  /// No description provided for @welcomeDescription3.
  ///
  /// In en, this message translates to:
  /// **'We safely back up your to-dos & preferences.'**
  String get welcomeDescription3;

  /// No description provided for @newFeaturesComingSoon.
  ///
  /// In en, this message translates to:
  /// **'New Features Coming Soon'**
  String get newFeaturesComingSoon;

  /// No description provided for @showCaseTips.
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get showCaseTips;

  /// No description provided for @showCaseAddTodo.
  ///
  /// In en, this message translates to:
  /// **'Create new todos'**
  String get showCaseAddTodo;

  /// No description provided for @addYourTodosAndCompleteThem.
  ///
  /// In en, this message translates to:
  /// **'Add your todos and complete them'**
  String get addYourTodosAndCompleteThem;

  /// No description provided for @showCaseTodos.
  ///
  /// In en, this message translates to:
  /// **'Your todos are here'**
  String get showCaseTodos;

  /// No description provided for @showCaseCompleted.
  ///
  /// In en, this message translates to:
  /// **'Your completed todos are here'**
  String get showCaseCompleted;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @errorOccured.
  ///
  /// In en, this message translates to:
  /// **'Error occured! Please try again later.'**
  String get errorOccured;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started'**
  String get letsStart;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deleteTodo.
  ///
  /// In en, this message translates to:
  /// **'Delete Todo'**
  String get deleteTodo;

  /// No description provided for @deleteTodos.
  ///
  /// In en, this message translates to:
  /// **'Delete Todos'**
  String get deleteTodos;

  /// No description provided for @deleteAllTodos.
  ///
  /// In en, this message translates to:
  /// **'Delete All Todos'**
  String get deleteAllTodos;

  /// No description provided for @deleteTodoMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this todo?'**
  String get deleteTodoMessage;

  /// No description provided for @deleteTodosMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete these todos?'**
  String get deleteTodosMessage;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// No description provided for @signInToContinueDescription.
  ///
  /// In en, this message translates to:
  /// **'You need to sign in to create, delete or update your to-dos. We need to make sure that your user experience has no missing points in any aspect.'**
  String get signInToContinueDescription;

  /// No description provided for @todoTipMessage.
  ///
  /// In en, this message translates to:
  /// **'You can swipe todos to delete or complete & long press to multi-select'**
  String get todoTipMessage;

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate Tick To Do'**
  String get rateApp;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About app'**
  String get aboutApp;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
