import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'diary.dart';

class Text_Screen extends StatefulWidget {
  const Text_Screen({Key? key}) : super(key: key);

  @override
  State<Text_Screen> createState() => _Text_ScreenState();
}

class _Text_ScreenState extends State<Text_Screen> {
  final textController = TextEditingController();
  final textController2 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool visibility = true;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            '오늘의 감정',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Icon(Icons.mail),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.16,
                ),
                Container(
                  width: width * 0.65,
                  child: TextField(
                    controller: textController,
                    cursorColor: Colors.black,
                    maxLines: 3,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: '오늘 하루 힘들었던 일,'
                            '                                   스트레스, 감정들을 적어보세요 ',
                        hintStyle: TextStyle(fontSize: width * 0.04)),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Container(
                  width: width * 0.65,
                  child: TextField(
                    controller: textController2,
                    cursorColor: Colors.black,
                    maxLines: 1,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: '말을 전하고 싶은 대상을 적어보세요',
                        hintStyle: TextStyle(fontSize: width * 0.04)),
                  ),
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Visibility(
                    visible: visibility,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          FocusScope.of(context).unfocus();
                        });
                        setState(() {
                          visibility = false;
                        });
                        setState(() {
                          _visible = true;
                        });
                      },
                      child: Container(
                          width: width * 0.15,
                          height: height * 0.045,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.grey,
                                    spreadRadius: 1)
                              ],
                              color: Colors.black),
                          child: Center(
                              child: Text(
                            '확인',
                            style: TextStyle(
                                color: Colors.white, fontSize: width * 0.045),
                          ))),
                    )),
                DelayedDisplay(
                  delay: Duration(seconds: 2),
                  child: Visibility(
                      visible: _visible,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Diary(
                                text: textController.text,
                                txt: textController2.text,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.045,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '전송',
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.045),
                            ),
                          ),
                        ),
                      )
                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.push(context,
                      //           MaterialPageRoute(builder: (context) => Send()));
                      //     },
                      //     style:
                      //         ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      //     child: Text('Send')),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
