import 'package:flutter/material.dart';
import 'package:flutterpeace/home.dart';

class Diary extends StatefulWidget {
  final String text;
  final String txt;
  const Diary({super.key, required this.text, required this.txt});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          '대상이라고 생각하고 말해보세요',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/person.png',
                    scale: 3,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: height * 0.15,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    widget.txt,
                    style: TextStyle(
                        fontSize: width * 0.068,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
                width: width * 0.75,
                height: height * 0.3,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SingleChildScrollView(
                    child: Text(
                  widget.text,
                  style: TextStyle(fontSize: width * 0.043),
                ))),
            SizedBox(
              height: height * 0.06,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Container(
                  width: width * 0.23,
                  height: height * 0.048,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1, color: Colors.grey, spreadRadius: 1)
                      ],
                      color: Colors.black),
                  child: Center(
                      child: Text(
                    '돌아가기',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.043),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
