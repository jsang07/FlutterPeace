import 'package:flutter/material.dart';
import 'package:flutterpeace/random_card.dart';
import 'package:flutterpeace/text.dart';
import 'meditation.dart';
import 'moktak.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentPageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPageIndex = 0;
  }

  Widget? _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Moktak();
      case 1:
        return Text_Screen();
      case 2:
        return randomCard();
      case 3:
        return Peace();
    }
    return null;
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Image.asset('assets/${iconName}_off.png', width: 20)),
      label: label,
      activeIcon: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Image.asset('assets/${iconName}_on.png', width: 20)),
    );
  }

  Widget _bottomWidget() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.black,
        selectedFontSize: 13,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        items: [
          _bottomNavigationBarItem('moktak', '목탁'),
          _bottomNavigationBarItem('txt', '고충'),
          _bottomNavigationBarItem('img', '글귀'),
          _bottomNavigationBarItem('yoga', '명상'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Exit'),
              content: Text('Do you want'),
              actions: [
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text('no')),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text('yes')),
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _bodyWidget(),
          bottomNavigationBar: _bottomWidget(),
        ),
      ),
    );
  }
}
