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
      darkTheme: ThemeData(),
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
      routes: {
        "/MusicPlayer": (context) => const MusicPlayer(),
        "/Track": (context) => const Tracks(),
        "/Playlist": (context) => const Playlists(),
        "/Album": (context) => const Albums(),
        "/Artist": (context) => const Artists(),


      },
      initialRoute: "/MusicPlayer",

    );
  }
}
