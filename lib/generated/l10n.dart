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

  /// `Create one`
  String get createOne {
    return Intl.message('Create one', name: 'createOne', desc: '', args: []);
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

  /// `Following`
  String get following {
    return Intl.message('Following', name: 'following', desc: '', args: []);
  }

  /// `MY Groups`
  String get myGroups {
    return Intl.message('MY Groups', name: 'myGroups', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Subject`
  String get subject {
    return Intl.message('Subject', name: 'subject', desc: '', args: []);
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

  /// `Add post`
  String get addPost {
    return Intl.message('Add post', name: 'addPost', desc: '', args: []);
  }

  /// `About me`
  String get aboutMe {
    return Intl.message('About me', name: 'aboutMe', desc: '', args: []);
  }

  /// `Tech tools`
  String get techTools {
    return Intl.message('Tech tools', name: 'techTools', desc: '', args: []);
  }

  /// `Social links`
  String get socialLinks {
    return Intl.message(
      'Social links',
      name: 'socialLinks',
      desc: '',
      args: [],
    );
  }

  /// `My SV`
  String get mySV {
    return Intl.message('My SV', name: 'mySV', desc: '', args: []);
  }

  /// `Edit Profile `
  String get editProfile {
    return Intl.message(
      'Edit Profile ',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Tap to preview the document`
  String get tapToPreviewTheDocument {
    return Intl.message(
      'Tap to preview the document',
      name: 'tapToPreviewTheDocument',
      desc: '',
      args: [],
    );
  }

  /// `Current group:`
  String get currentGroup {
    return Intl.message(
      'Current group:',
      name: 'currentGroup',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message('See all', name: 'seeAll', desc: '', args: []);
  }

  /// `Activities`
  String get activities {
    return Intl.message('Activities', name: 'activities', desc: '', args: []);
  }

  /// `Info`
  String get info {
    return Intl.message('Info', name: 'info', desc: '', args: []);
  }

  /// `View Profile`
  String get viewProfile {
    return Intl.message(
      'View Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message('Follow', name: 'follow', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Tap to return to the top`
  String get tapToReturntoTheTop {
    return Intl.message(
      'Tap to return to the top',
      name: 'tapToReturntoTheTop',
      desc: '',
      args: [],
    );
  }

  /// `Groups Management`
  String get groupsManagement {
    return Intl.message(
      'Groups Management',
      name: 'groupsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Group Member`
  String get groupMember {
    return Intl.message(
      'Group Member',
      name: 'groupMember',
      desc: '',
      args: [],
    );
  }

  /// `Group Members`
  String get groupMembers {
    return Intl.message(
      'Group Members',
      name: 'groupMembers',
      desc: '',
      args: [],
    );
  }

  /// `Group Admin`
  String get groupAdmin {
    return Intl.message('Group Admin', name: 'groupAdmin', desc: '', args: []);
  }

  /// `Role`
  String get role {
    return Intl.message('Role', name: 'role', desc: '', args: []);
  }

  /// `Tools`
  String get tools {
    return Intl.message('Tools', name: 'tools', desc: '', args: []);
  }

  /// `Add member`
  String get addMember {
    return Intl.message('Add member', name: 'addMember', desc: '', args: []);
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `if your group is not completed, you can advertise a vacancy`
  String get ifGroupIsNotCompleted {
    return Intl.message(
      'if your group is not completed, you can advertise a vacancy',
      name: 'ifGroupIsNotCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Advertise a vacancy`
  String get advertiseAVacancy {
    return Intl.message(
      'Advertise a vacancy',
      name: 'advertiseAVacancy',
      desc: '',
      args: [],
    );
  }

  /// `Enter your role`
  String get enterYourRole {
    return Intl.message(
      'Enter your role',
      name: 'enterYourRole',
      desc: '',
      args: [],
    );
  }

  /// `Please, pick your gender!`
  String get pleasePickGender {
    return Intl.message(
      'Please, pick your gender!',
      name: 'pleasePickGender',
      desc: '',
      args: [],
    );
  }

  /// `Plese, Select Your role!`
  String get pleaseSelectRole {
    return Intl.message(
      'Plese, Select Your role!',
      name: 'pleaseSelectRole',
      desc: '',
      args: [],
    );
  }

  /// `Please, Select your specialization!`
  String get pleaseSelectSpacialization {
    return Intl.message(
      'Please, Select your specialization!',
      name: 'pleaseSelectSpacialization',
      desc: '',
      args: [],
    );
  }

  /// `we have sent you a four_digits verification code to your email :`
  String get fourDigitsCode {
    return Intl.message(
      'we have sent you a four_digits verification code to your email :',
      name: 'fourDigitsCode',
      desc: '',
      args: [],
    );
  }

  /// `check your email inbox and inter the code :`
  String get codeVerification {
    return Intl.message(
      'check your email inbox and inter the code :',
      name: 'codeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Add the final touches`
  String get addFinalTouches {
    return Intl.message(
      'Add the final touches',
      name: 'addFinalTouches',
      desc: '',
      args: [],
    );
  }

  /// `Let’s find you some frineds`
  String get findYouFriends {
    return Intl.message(
      'Let’s find you some frineds',
      name: 'findYouFriends',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `management & privacy`
  String get managementAndPrivacy {
    return Intl.message(
      'management & privacy',
      name: 'managementAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Change name and password`
  String get changeNameAndPassowrd {
    return Intl.message(
      'Change name and password',
      name: 'changeNameAndPassowrd',
      desc: '',
      args: [],
    );
  }

  /// `Change email`
  String get changeEmail {
    return Intl.message(
      'Change email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Posts management`
  String get postsManagement {
    return Intl.message(
      'Posts management',
      name: 'postsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message('Dark mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Change language`
  String get changeLanguage {
    return Intl.message(
      'Change language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Select your specialization`
  String get selectYourSpacialization {
    return Intl.message(
      'Select your specialization',
      name: 'selectYourSpacialization',
      desc: '',
      args: [],
    );
  }

  /// `please enter birth date`
  String get pleaseEnterBirthDate {
    return Intl.message(
      'please enter birth date',
      name: 'pleaseEnterBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `company name`
  String get companyName {
    return Intl.message(
      'company name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Create post`
  String get createPost {
    return Intl.message('Create post', name: 'createPost', desc: '', args: []);
  }

  /// `Post`
  String get post {
    return Intl.message('Post', name: 'post', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `title`
  String get title {
    return Intl.message('title', name: 'title', desc: '', args: []);
  }

  /// `project`
  String get project {
    return Intl.message('project', name: 'project', desc: '', args: []);
  }

  /// `Mention`
  String get mention {
    return Intl.message('Mention', name: 'mention', desc: '', args: []);
  }

  /// `Add tags`
  String get addTags {
    return Intl.message('Add tags', name: 'addTags', desc: '', args: []);
  }

  /// `Add images`
  String get addImages {
    return Intl.message('Add images', name: 'addImages', desc: '', args: []);
  }

  /// `Mention and share this post with your friends`
  String get mentionAndShareWithFriends {
    return Intl.message(
      'Mention and share this post with your friends',
      name: 'mentionAndShareWithFriends',
      desc: '',
      args: [],
    );
  }

  /// `add some tags`
  String get addSomeTags {
    return Intl.message(
      'add some tags',
      name: 'addSomeTags',
      desc: '',
      args: [],
    );
  }

  /// `add group`
  String get addGroup {
    return Intl.message('add group', name: 'addGroup', desc: '', args: []);
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
