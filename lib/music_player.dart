import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool _isPlaying = false;
  bool _suffled = false;
  bool _looped = false;
  bool _isFavorite = false;

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var mate = const Color(0xff595260);

    playpause() {
      setState(() {
        _isPlaying = !_isPlaying;
      });
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    ));

    String formatTime(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');

      final hours = twoDigits(duration.inHours);
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      return [
        if (duration.inHours > 0) hours,
        minutes,
        seconds,
      ].join(':');
    }

    @override
    void initState() {
      super.initState();
      // Add code after super

      audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      });

      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });

      audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    }

    Future setAudio() async {
      //loop
      audioPlayer.setReleaseMode(ReleaseMode.loop);

      audioPlayer.setSourceDeviceFile("assets/music/sunflower.mp3");
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.1,
                width: width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/PlayLists");

                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: height * 0.035,
                        )),
                    Center(
                        child: Text(
                          "Playing Now",
                          style: TextStyle(
                              fontSize: 30, color: mate, fontWeight: FontWeight.w300),
                        )),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      icon: _isFavorite
                          ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: height * 0.035,
                      )
                          : Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: height * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.075,
                width: width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wish You Were Here",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: mate,
                        ),
                      ),
                      Text(
                        "Pink Floyd",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w300,
                          color: mate,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.045,
              ),
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                height: height * 0.4,
                width: width * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Albumart.jpg"),
                        fit: BoxFit.fill),
                    boxShadow: !_isPlaying
                        ?
                    // Elevation Effect
                    [
                      const BoxShadow(
                        color: Color(0xFFBEBEBE),
                        // Shadow for bottom right corner
                        offset: Offset(10, 10),
                        blurRadius: 30,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        // Shadow for top left corner
                        offset: Offset(-10, -10),
                        blurRadius: 30,
                        spreadRadius: 1,
                      ), // White Shadow
                    ]
                        : [const BoxShadow(color: Colors.grey)],
                    color: mate,
                    borderRadius: const BorderRadius.all(Radius.circular(35))),
              ),
              SizedBox(
                height: height * 0.09,
              ),
              SizedBox(
                height: height * 0.015,
                width: width * 0.85,
                child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                  },
                ), // Slider
              ),
              SizedBox(
                height: height * 0.04,
                width: width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      formatTime(duration - position),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: width * 0.015),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _suffled = !_suffled;
                      });
                    },
                    icon: Icon(
                      Icons.shuffle,
                      color: _suffled ? Colors.lightBlueAccent : Colors.grey,
                      size: height * 0.035,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.grey,
                      size: height * 0.035,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      playpause();
                          () async {
                        if (_isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          String url = "hello.hi";
                          //await audioPlayer.play();
                        }
                      };
                    },
                    child: AnimatedContainer(
                      // ignore: sort_child_properties_last
                      child: Icon(
                        _isPlaying ? Icons.pause_circle : Icons.play_circle,
                        size: 80,
                        // Changing icon color on
                        // the basis of it's elevation
                        color: _isPlaying ? Colors.grey[400] : Colors.grey,
                      ),
                      // Providing duration parameter
                      // to create animation
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        // If widget is not elevated, elevate it.
                        boxShadow: _isPlaying
                            ? [const BoxShadow(color: Colors.grey)]
                            :
                        // Elevation Effect
                        [
                          const BoxShadow(
                            color: Color(0xFFBEBEBE),
                            // Shadow for bottom right corner
                            offset: Offset(10, 10),
                            blurRadius: 30,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            // Shadow for top left corner
                            offset: Offset(-10, -10),
                            blurRadius: 30,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.grey,
                      size: height * 0.035,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _looped = !_looped;
                      });
                    },
                    icon: Icon(
                      Icons.loop,
                      color: _looped ? Colors.blue : Colors.grey,
                      size: height * 0.035,
                    ),
                  ),
                  SizedBox(width: width * 0.015),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}