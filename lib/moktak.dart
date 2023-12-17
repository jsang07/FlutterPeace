import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Moktak extends StatefulWidget {
  const Moktak({super.key});

  @override
  State<Moktak> createState() => _MoktakState();
}

class _MoktakState extends State<Moktak> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            '마음의 평화',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/moktak_on.png',
                width: width * 0.08,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: height * 0.2,
            ),
            Container(
                width: width * 0.45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    final player = AudioPlayer();
                    player.play(AssetSource('moktak.mp3'));
                  },
                  child: Image.asset('assets/moktak_on.png'),
                )),
            SizedBox(
              height: height * 0.05,
            ),
            Text(
              'TOUCH!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: width * 0.07),
            ),
          ]),
        ),
      ),
    );
  }
}
