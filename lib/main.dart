import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color clrBlueGrayDarker = const Color(0xff222831); //clr means color
  Color clrBlueGray = const Color(0xff393E46);
  Color clrTeal = const Color(0xff00ADB5);
  Color clrGreen = const Color(0xff00B57F);
  Color clrGrey = const Color(0xffe4e4e4);
  Color clrRedBold = const Color(0xffB50031);
  int selected = 1;
  bool newGame = false;
  var ran = Random();
  String AITxt = "🤖";
  String gameStatus = " ";

  @override
  Widget build(BuildContext context) {
    Color clrTopBarColor = clrBlueGrayDarker;
    void showToastMessage(String message) {
      Fluttertoast.showToast(
          msg: message, //message to show toast
          //toastLength: Toast.LENGTH_LONG, //duration for message to show
          gravity: ToastGravity.TOP, //where you want to show, top, bottom
          //timeInSecForIosWeb: 1, //for iOS only
          //backgroundColor: Colors.red, //background Color for message
          textColor: Colors.white, //message text color
          fontSize: 16.0 //message font size
          );
    }

    if (newGame == true) {
      switch (selected) {
        case 1:
          int AI = ran.nextInt(3) + 1;
          if (AI == 1) {
            AITxt = "💎";
            gameStatus = "It's Draw😐";
            clrTopBarColor = clrBlueGrayDarker;
            showToastMessage("AI-> Rock: Draw");
          } else if (AI == 2) {
            gameStatus = "You lost😭";
            clrTopBarColor = clrRedBold;
            AITxt = "🧻";
            showToastMessage("AI->Paper: You lose");
          } else if (AI == 3) {
            gameStatus = "You won😎";
            clrTopBarColor = clrGreen;
            AITxt = "✂️";
            showToastMessage("AI->Scissors: You win");
          }
          break;

        case 2:
          int AI = ran.nextInt(3) + 1;
          if (AI == 1) {
            AITxt = "💎";
            clrTopBarColor = clrGreen;
            gameStatus = "You won😎";
            showToastMessage("AI->Rock: You win");
          } else if (AI == 2) {
            AITxt = "🧻";
            clrTopBarColor = clrBlueGrayDarker;
            gameStatus = "It's Draw😐";
            showToastMessage("AI->Paper: Draw");
          } else if (AI == 3) {
            AITxt = "✂️";
            clrTopBarColor = clrRedBold;
            gameStatus = "You lost😭";
            showToastMessage("AI->Scissors: You lose");
          }
          break;
        case 3:
          int AI = ran.nextInt(3) + 1;
          if (AI == 1) {
            AITxt = "💎";
            gameStatus = "You lost😭";
            clrTopBarColor = clrRedBold;
            showToastMessage("AI->Rock: You lose");
          } else if (AI == 2) {
            AITxt = "🧻";
            clrTopBarColor = clrGreen;
            gameStatus = "You won😎";
            showToastMessage("AI->Paper: You win");
          } else if (AI == 3) {
            AITxt = "✂️";
            gameStatus = "It's Draw😐";
            clrTopBarColor = clrBlueGrayDarker;
            showToastMessage("AI->Scissors: Draw");
          }
          break;
      }
    }
    return Scaffold(
      backgroundColor: clrBlueGray,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
              color: clrTopBarColor,
              child: Text(
                gameStatus,
                textAlign: TextAlign.center,
                style: TextStyle(color: clrGrey),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              AITxt,
              style: const TextStyle(
                fontSize: 80.0,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 120,
              height: 60,
              color: clrBlueGrayDarker,
              child: Text(
                "AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: clrGrey,
                ),
              ),
            ),
            const SizedBox(height: 225),
            Row(
              children: [
                const SizedBox(width: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 65),
                  ),
                  onPressed: () {
                    setState(() {
                      selected = 1;
                      newGame = true;
                    });
                  },
                  child: const Text("💎"),
                ),
                const SizedBox(width: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 65),
                  ),
                  onPressed: () {
                    setState(() {
                      selected = 2;
                      newGame = true;
                    });
                  },
                  child: const Text("🧻"),
                ),
                const SizedBox(width: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 65),
                  ),
                  onPressed: () {
                    setState(() {
                      selected = 3;
                      newGame = true;
                    });
                  },
                  child: const Text("✂️"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 50,
              color: clrBlueGrayDarker,
              child: Text(
                "You",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: clrGrey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 60,
              color: clrTeal,
              child: Text(
                "New game",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: clrGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
