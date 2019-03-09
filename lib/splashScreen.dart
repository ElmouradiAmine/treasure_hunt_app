//Default imports
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

//My imports
import 'main.dart';


class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  int counter = 0;
  _getCurrentRiddle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) ;
    });

  }


  @override
  void initState() {
    super.initState();
    _getCurrentRiddle();
    print(counter);
  }


  @override
  Widget build(BuildContext context) {

    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: counter >= 6 ? MyApp.scorePage :  MyApp.riddles[counter],
      loaderColor: Colors.red,
      gradientBackground: Gradients.backToFuture,
      image: Image.asset('images/logo.png'),
      photoSize: 120.0,
      loadingText: Text('Please wait...',textAlign: TextAlign.center,),
      title: Text('Let the hunt begin !',textAlign: TextAlign.center,style: TextStyle(
        fontFamily: 'BlackPearl',
        fontSize: 21.0,
        color: Color(0xff331a00),
          fontWeight: FontWeight.bold
      )

        ,),
      styleTextUnderTheLoader: TextStyle(
        fontSize: 21,
      ),
    );


  }
}