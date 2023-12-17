import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Music extends StatefulWidget {
  final String url;
  final String image;
  final Color color;
  const Music(
      {Key? key, required this.url, required this.image, required this.color})
      : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  bool isPlaying = false;
  double value = 0;

  final player = AudioPlayer();

  Duration? duration = const Duration(seconds: 0);

  void initPlayer() async {
    await player.setSourceUrl(widget.url);
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.16,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(widget.image, width: width * 0.55),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${(value / 60).floor()} : ${(value % 60).floor()}',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.045)),
                    Slider.adaptive(
                      onChanged: (v) {
                        setState(() {
                          value = v;
                        });
                      },
                      min: 0.0,
                      max: duration!.inSeconds.toDouble(),
                      value: value,
                      onChangeEnd: (newValue) async {
                        setState(() {
                          value = newValue;
                          print(newValue);
                        });
                        player.pause();
                        await player.seek(Duration(seconds: newValue.toInt()));
                        player.resume();
                      },
                      activeColor: Colors.white,
                    ),
                    Text('${duration!.inMinutes} : ${duration!.inSeconds % 60}',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.045))
                  ],
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                InkWell(
                  onTap: () async {
                    if (isPlaying) {
                      await player.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      await player.resume();
                      setState(() {
                        isPlaying = true;
                      });

                      player.onPositionChanged.listen((position) {
                        setState(() {
                          value = position.inSeconds.toDouble();
                        });
                      });
                    }
                  },
                  child: Container(
                      width: width * 0.13,
                      height: height * 0.063,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: widget.color, width: width * 0.007),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
