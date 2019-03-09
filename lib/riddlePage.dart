import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiddlePage extends StatefulWidget {
  final String code;
  final String title;
  final String imagePath;
  final String textRiddle;
  final String routeName;
  final String percentStr;
  final double percentDouble;
  final int index;

  RiddlePage(
      {this.code, this.title, this.index, this.imagePath, this.textRiddle, this.routeName, this.percentStr, this.percentDouble});
  @override
  _RiddlePageState createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final myController = TextEditingController();
  bool errorHintShow = false;

  int counter = 0;
  _getCurrentRiddle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter = (prefs.getInt('counter') ?? 0) ;
    print("LOOOK HERE");
    print(counter);
  }


  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('counter', widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearPercentIndicator(
                width: 250,
                lineHeight: 16.0,
                percent: widget.percentDouble,
                center: Text(
                  widget.percentStr,
                  style: new TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,fontFamily: 'BlackPearl'),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(AssetImage('images/treasureIcon.png')),
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontFamily: 'BlackPearl'),
          ),
          Center(
            child: Container(
                width: 300,
                height: 170,
                child: Image.asset(
                  widget.imagePath,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 8, left: 16, right: 16),
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.textRiddle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontFamily: 'Primitive'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 180,
                height: 50,
                child: TextField(
                  controller: myController,
                  onChanged: (text) {
                    setState(() {
                      errorHintShow = false;
                    });
                  },
                  textCapitalization: TextCapitalization.characters,
                  maxLines: 1,
                  maxLength: 8,
                  cursorColor: Colors.orange,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      errorText: !errorHintShow ? "" : "Wrong code captain!",
                      errorStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(),
                      labelStyle:
                          TextStyle(fontSize: 18, fontFamily: 'BlackPearl' ),
                      hintText: 'CODE',
                      hintStyle:
                          TextStyle(fontSize: 18, fontFamily: 'BlackPearl',)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                splashColor: Colors.white,
                elevation: 5,
                shape: StadiumBorder(),
                color: Colors.black,
                child: Text(
                  'Validate',
                  style:
                      TextStyle(color: Colors.orange, fontFamily: 'BlackPearl'),
                ),
                onPressed: () {
                  setState(() {
                    if (myController.text.toLowerCase() == widget.code) {
                      _getCurrentRiddle();
                      _saveData();
                      Navigator.pushReplacementNamed(context, widget.routeName);
                    } else
                      errorHintShow = true;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
