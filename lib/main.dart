import 'package:flutter/material.dart';
import 'package:musica/Playlist%20Screens/artists.dart';
import 'package:musica/Playlist%20Screens/playlists.dart';
import 'package:musica/Playlist%20Screens/tracks.dart';
import 'package:musica/music_player.dart';

import 'Playlist Screens/albums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Musica",
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(),
      theme: ThemeData(),
      routes: {
        "/MusicPlayer": (context) => const MusicPlayer(),
        "/Tracks": (context) => const Tracks(),
        "/PlayLists": (context) => const Playlists(),
        "/Albums": (context) => const Albums(),
        "/Artists": (context) => const Artists(),


      },
      initialRoute: "/MusicPlayer",

    );
  }
}
