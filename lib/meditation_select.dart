import 'package:flutter/material.dart';
import 'package:flutterpeace/music.dart';

class Selects extends StatefulWidget {
  Selects({Key? key}) : super(key: key);

  @override
  State<Selects> createState() => _SelectsState();
}

class _SelectsState extends State<Selects> {
  Tile(String url, String image, Color color) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Music(
                  url: url,
                  image: image,
                  color: color,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.53,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(image),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          '명상카드를 선택하세요',
          style: TextStyle(fontSize: 18),
        ),
        actions: const [
          Icon(Icons.emoji_emotions_outlined),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Tile(
                          'https://ia904705.us.archive.org/18/items/birdnature/birdnature.mp3',
                          'assets/for.png',
                          Colors.green.shade400),
                      Tile(
                        'https://ia601603.us.archive.org/27/items/spacepiano/ballnature.mp3',
                        'assets/temple.png',
                        Colors.blue.shade200,
                      ),
                      Tile(
                          'https://ia601603.us.archive.org/27/items/spacepiano/wavesingball.mp3',
                          'assets/sunset.png',
                          Colors.deepOrange.shade300),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Column(
                    children: [
                      Tile(
                          'https://ia601603.us.archive.org/27/items/spacepiano/pianorain.mp3',
                          'assets/rain.png',
                          Colors.indigo.shade700),
                      Tile(
                          'https://ia601603.us.archive.org/27/items/spacepiano/wavepiano.mp3',
                          'assets/gal.png',
                          Colors.lightBlue.shade400),
                      Tile(
                        'https://ia601603.us.archive.org/27/items/spacepiano/spacepiano.mp3',
                        'assets/space.png',
                        Colors.teal.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
