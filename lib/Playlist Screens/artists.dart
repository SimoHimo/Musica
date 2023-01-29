import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({Key? key}) : super(key: key);

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, "/MusicPlayer");}, child: Text("/Artists")),
    );
  }
}
