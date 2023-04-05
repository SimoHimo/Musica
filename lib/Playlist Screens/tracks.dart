import 'package:flutter/material.dart';

class Tracks extends StatefulWidget {
  const Tracks({Key? key}) : super(key: key);

  @override
  State<Tracks> createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, "/MusicPlayer");}, child: Text("/Tracks")),
    );
  }
}
