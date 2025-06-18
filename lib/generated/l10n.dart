// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `With Graph, you're always part of the ITE circle.`
  String get onboarding1 {
    return Intl.message(
      'With Graph, you\'re always part of the ITE circle.',
      name: 'onboarding1',
      desc: '',
      args: [],
    );
  }

  /// `From quick thoughts to deep ideas, everything starts with a post.`
  String get onboarding2 {
    return Intl.message(
      'From quick thoughts to deep ideas, everything starts with a post.',
      name: 'onboarding2',
      desc: '',
      args: [],
    );
  }

  /// `Find teammates, create project groups, and collaborate with ease.`
  String get onboarding3 {
    return Intl.message(
      'Find teammates, create project groups, and collaborate with ease.',
      name: 'onboarding3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Begin`
  String get begin {
    return Intl.message('Begin', name: 'begin', desc: '', args: []);
  }

  /// `Login to your account`
  String get loginTitle {
    return Intl.message(
      'Login to your account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create one!`
  String get createOne {
    return Intl.message('Create one!', name: 'createOne', desc: '', args: []);
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login!`
  String get login {
    return Intl.message('Login!', name: 'login', desc: '', args: []);
  }

  /// `Who’s Joining Us?`
  String get whoIsJoining {
    return Intl.message(
      'Who’s Joining Us?',
      name: 'whoIsJoining',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get to Know You`
  String get getToKnowYou {
    return Intl.message(
      'Let’s Get to Know You',
      name: 'getToKnowYou',
      desc: '',
      args: [],
    );
  }

  /// `What should we call you?`
  String get whatToCallYou {
    return Intl.message(
      'What should we call you?',
      name: 'whatToCallYou',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Tell Us About Yourself`
  String get tellAboutYourself {
    return Intl.message(
      'Tell Us About Yourself',
      name: 'tellAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `When's your birthday?`
  String get birthday {
    return Intl.message(
      'When\'s your birthday?',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Pick your gender:`
  String get pickGender {
    return Intl.message(
      'Pick your gender:',
      name: 'pickGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `How will you be using the app?`
  String get howUsingApp {
    return Intl.message(
      'How will you be using the app?',
      name: 'howUsingApp',
      desc: '',
      args: [],
    );
  }

  /// `Which path will you use?`
  String get whichPath {
    return Intl.message(
      'Which path will you use?',
      name: 'whichPath',
      desc: '',
      args: [],
    );
  }

  /// `Student Account`
  String get studentAccount {
    return Intl.message(
      'Student Account',
      name: 'studentAccount',
      desc: '',
      args: [],
    );
  }

  /// `Non-Student Account`
  String get nonStudentAccount {
    return Intl.message(
      'Non-Student Account',
      name: 'nonStudentAccount',
      desc: '',
      args: [],
    );
  }

  /// `Almost there.`
  String get almostThere {
    return Intl.message(
      'Almost there.',
      name: 'almostThere',
      desc: '',
      args: [],
    );
  }

  /// `Just a few details!`
  String get fewDetails {
    return Intl.message(
      'Just a few details!',
      name: 'fewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Let's specify your role.`
  String get specifyRole {
    return Intl.message(
      'Let\'s specify your role.',
      name: 'specifyRole',
      desc: '',
      args: [],
    );
  }

  /// `Select your role`
  String get selectRole {
    return Intl.message(
      'Select your role',
      name: 'selectRole',
      desc: '',
      args: [],
    );
  }

  /// `Let's get acquainted with your collage stage.`
  String get collageStage {
    return Intl.message(
      'Let\'s get acquainted with your collage stage.',
      name: 'collageStage',
      desc: '',
      args: [],
    );
  }

  /// `That will help us customize your feature later`
  String get customizeFeatures {
    return Intl.message(
      'That will help us customize your feature later',
      name: 'customizeFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Select your study year`
  String get selectYear {
    return Intl.message(
      'Select your study year',
      name: 'selectYear',
      desc: '',
      args: [],
    );
  }

  /// `Pick your specialization`
  String get pickSpecialization {
    return Intl.message(
      'Pick your specialization',
      name: 'pickSpecialization',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineering`
  String get softwareEng {
    return Intl.message(
      'Software Engineering',
      name: 'softwareEng',
      desc: '',
      args: [],
    );
  }

  /// `Artificial Intelligence`
  String get ai {
    return Intl.message(
      'Artificial Intelligence',
      name: 'ai',
      desc: '',
      args: [],
    );
  }

  /// `Networks and OS`
  String get networks {
    return Intl.message(
      'Networks and OS',
      name: 'networks',
      desc: '',
      args: [],
    );
  }

  /// `Let's customize your profile`
  String get customizeProfile {
    return Intl.message(
      'Let\'s customize your profile',
      name: 'customizeProfile',
      desc: '',
      args: [],
    );
  }

  /// `optional`
  String get optional {
    return Intl.message('optional', name: 'optional', desc: '', args: []);
  }

  /// `Upload Your Picture`
  String get uploadPicture {
    return Intl.message(
      'Upload Your Picture',
      name: 'uploadPicture',
      desc: '',
      args: [],
    );
  }

  /// `Profile pictures help others recognize you.`
  String get pictureHelp {
    return Intl.message(
      'Profile pictures help others recognize you.',
      name: 'pictureHelp',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message('Followers', name: 'followers', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Follower`
  String get follower {
    return Intl.message('Follower', name: 'follower', desc: '', args: []);
  }

  /// `following`
  String get following {
    return Intl.message('following', name: 'following', desc: '', args: []);
  }

  /// `MY Groups`
  String get myGroups {
    return Intl.message('MY Groups', name: 'myGroups', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `subject`
  String get subject {
    return Intl.message('subject', name: 'subject', desc: '', args: []);
  }

  /// `Team Rate`
  String get teamRate {
    return Intl.message('Team Rate', name: 'teamRate', desc: '', args: []);
  }

  /// `en`
  String get lang {
    return Intl.message('en', name: 'lang', desc: '', args: []);
  }

  /// `This field is required`
  String get thisFieldRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Groups management`
  String get groupsManagement {
    return Intl.message(
      'Groups management',
      name: 'groupsManagement',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
