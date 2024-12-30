import 'package:flutter/material.dart';
import 'package:music_app/routes/routenames.dart';
import 'package:music_app/view/home.dart';
import 'package:music_app/view/playlist.dart';
import 'package:music_app/view/settings.dart';
import 'package:music_app/view/song.dart';

class Routes {
  static Route<dynamic> generateroutes(RouteSettings setting) {
    switch (setting.name) {
      case Routenames.setting:
        return MaterialPageRoute(
          builder: (context) => SettingPage(),
        );
      case Routenames.playlist:
        return MaterialPageRoute(
          builder: (context) => PlaylistPage(),
        );
      case Routenames.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routenames.song:
        return MaterialPageRoute(
          builder: (context) => SongPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
  }
}
