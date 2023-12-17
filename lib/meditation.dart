import 'package:flutter/material.dart';

import 'meditation_select.dart';

class Peace extends StatefulWidget {
  @override
  State<Peace> createState() => _PeaceState();
}

class _PeaceState extends State<Peace> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Text('하루 15분에서 30분',
                      style: TextStyle(
                        fontSize: width * 0.058,
                        color: Colors.black,
                      )),
                  SizedBox(height: height * 0.02),
                  Text('명상을 통해',
                      style: TextStyle(
                          fontSize: width * 0.062,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(' 마음의 평화를 얻어보세요',
                      style: TextStyle(
                        fontSize: width * 0.058,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset('assets/med.png'),
                  width: width,
                  height: height * 0.4,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 140,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: SizedBox(
                        height: height * 0.06,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Selects(),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ],
                            ),
                            child: Center(
                                child: Text(
                              'START',
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.06),
                            )),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
