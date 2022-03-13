import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Provides [AppInfo & LicenseInfo] of the app.
class AppInfoProvider {
  //** P R O V I D E S    A P P I C O N **//
  final Widget _applicationIcon = const FaIcon(
    FontAwesomeIcons.gamepad,
    size: 40,
  );
  Widget get applicationIcon => _applicationIcon;

  //** P R O V I D E S    A P P N A M E **//
  final String _applicationName = 'Puzzle Hack';
  String get applicationName => _applicationName;

  //** P R O V I D E S    A P P V E R S I O N **//
  final String _applicationVersion = 'v1.0.0';
  String get applicationVersion => _applicationVersion;

  //** P R O V I D E S    A P P L E G A L E S E **//
  final String _applicationLegalese = '©2022, http://mdsiam.xyz/';
  String get applicationLegalese => _applicationLegalese;

  //** P R O V I D E S    A P P I N T R O **//
  final List<Widget> _children = [
    const Text(
      '''\n   This game is for the "Flutter Puzzle Hack" contest, 2022. It is a simple slide puzzle game, where the player has to arrange the squares into sorted order.\n   For license information, click on the 'VIEW LICENSES' button below.''',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    ),
  ];
  List<Widget> get children => _children;
}
