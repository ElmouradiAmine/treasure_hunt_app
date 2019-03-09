//Default import
import 'package:flutter/material.dart';

//My imports
import 'splashScreen.dart';
import 'riddlePage.dart';
import 'scorePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final List<RiddlePage> riddles = [
    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Treasure Map',
      imagePath: 'images/treasure_map.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.0,
      percentStr: "0%",
      index: 1,
      routeName: 'riddle1',
    ),
    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Pirate Ship',
      imagePath: 'images/ship.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.20,
      percentStr: "20%",
      index: 2,
      routeName: 'riddle2',
    ),
    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Sea Storm',
      imagePath: 'images/seaStorm.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.40,
      percentStr: "40%",
      index: 3,
      routeName: 'riddle3',
    ),
    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Mysterious Island',
      imagePath: 'images/island.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.60,
      percentStr: "60%",
      index: 4,
      routeName: 'riddle4',
    ),
    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Gardien Treasure',
      imagePath: 'images/gardienTreasure.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.80,
      percentStr: "80%",
      index: 5,
      routeName: 'riddle5',
    ),

    RiddlePage(
      code: 'aaaaaaaa',
      title: 'Lost Treasure',
      imagePath: 'images/treasure.png',
      textRiddle: 'Lorem ipsum dolor sit amet, '
          'consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, ',
      percentDouble: 0.9,
      percentStr: "90%",
      index: 6,
      routeName: 'scorePage',
    ),

  ];

  final String title = 'Treasure hunt';
  static final ScorePage scorePage = ScorePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'riddle0': (context) => riddles[0],
        'riddle1': (context) => riddles[1],
        'riddle2': (context) => riddles[2],
        'riddle3': (context) => riddles[3],
        'riddle4': (context) => riddles[4],
        'riddle5': (context) => riddles[5],
        'scorePage': (context) => scorePage,
      },
      title: title,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: MySplashScreen(),
    );
  }
}
