import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
class ScorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 32,left: 32,right: 32,bottom: 12.0),
              child: Image.asset('images/logo.png'),
            ),
            Stack(
              children: <Widget>[
                Container(
                    width: 270,
                    child: Image.asset('images/carte.png')),
              ],
            ),

          ],
        ),
        decoration: BoxDecoration(
          gradient: Gradients.backToFuture,
        ),
      ),
    );
  }
}

