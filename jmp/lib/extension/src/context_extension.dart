import 'package:flutter/material.dart';
import 'package:jmp/feature/feature.dart';
import 'package:jmp/main/launch_helper.dart';
import 'package:jmp/resource/resource.dart';
import 'package:jmp/utility/utility.dart';
import 'package:model/model.dart';
import 'package:provider/provider.dart';

/// {@template context_extensions}
/// Extension methods on [BuildContext] to access apps critical objects easily.
/// {@endtemplate}
extension ContextExtension on BuildContext {
  /// A shortcut to get localizations object
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  /// Returns the dynamic theme of the app
  AppTheme get theme => Provider.of<AppTheme>(this, listen: false).dynamicTheme;

  /// Returns the flavor which the app is currently running in.
  Flavor get flavor => Provider.of<Flavor>(this, listen: false);

  /// Returns the current user of the app.
  User get user => Provider.of<AppCubit>(this, listen: false).state.currentUser;
}
