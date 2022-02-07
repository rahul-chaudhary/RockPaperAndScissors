import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rps/colors.dart';
import 'package:rps/toast_message.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.courierPrimeTextTheme(
          //latoTextTheme
          Theme.of(context).textTheme,
        ),
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
  int selected = 0;
  bool newGame = false;
  var ran = Random();
  String aiTxt = "🤖";
  String gameStatus = " ";

  @override
  Widget build(BuildContext context) {
    MyColors clr = MyColors(); //MyColors object
    ToastMessage toastMsg = ToastMessage();

    Color clrTopBarColor = clr.clrBlueGrayDarker;

    if (newGame == true) {
      switch (selected) {
        case 0:
          aiTxt = "🤖";
          break;
        case 1:
          int ai = ran.nextInt(3) + 1;
          if (ai == 1) {
            aiTxt = "💎";
            gameStatus = "It's Draw😐";
            clrTopBarColor = clr.clrBlueGrayDarker;
            toastMsg.showToastMessage("AI-> Rock: Draw");
          } else if (ai == 2) {
            gameStatus = "You lost😭";
            clrTopBarColor = clr.clrRedBold;
            aiTxt = "🧻";
            toastMsg.showToastMessage("AI->Paper: You lose");
          } else if (ai == 3) {
            gameStatus = "You won😎";
            clrTopBarColor = clr.clrGreen;
            aiTxt = "✂️";
            toastMsg.showToastMessage("AI->Scissors: You win");
          }
          break;

        case 2:
          int ai = ran.nextInt(3) + 1;
          if (ai == 1) {
            aiTxt = "💎";
            clrTopBarColor = clr.clrGreen; //green
            gameStatus = "You won😎";
            toastMsg.showToastMessage("AI->Rock: You win");
          } else if (ai == 2) {
            aiTxt = "🧻";
            clrTopBarColor = clr.clrBlueGrayDarker; //draw color
            gameStatus = "It's Draw😐";
            toastMsg.showToastMessage("AI->Paper: Draw");
          } else if (ai == 3) {
            aiTxt = "✂️";
            clrTopBarColor = clr.clrRedBold;
            gameStatus = "You lost😭";
            toastMsg.showToastMessage("AI->Scissors: You lose");
          }
          break;
        case 3:
          int ai = ran.nextInt(3) + 1;
          if (ai == 1) {
            aiTxt = "💎";
            gameStatus = "You lost😭";
            clrTopBarColor = clr.clrRedBold;
            toastMsg.showToastMessage("AI->Rock: You lose");
          } else if (ai == 2) {
            aiTxt = "🧻";
            clrTopBarColor = clr.clrGreen;
            gameStatus = "You won😎";
            toastMsg.showToastMessage("AI->Paper: You win");
          } else if (ai == 3) {
            aiTxt = "✂️";
            gameStatus = "It's Draw😐";
            clrTopBarColor = clr.clrBlueGrayDarker;
            toastMsg.showToastMessage("AI->Scissors: Draw");
          }
          break;
      }
    }
    return Scaffold(
      backgroundColor: clr.clrBlueGray,
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
                style: TextStyle(
                  fontSize: 44,
                  color: clr.clrGrey,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              aiTxt,
              style: TextStyle(
                fontSize: 80,
                color: clr.clrGrey,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 120,
              height: 60,
              color: clr.clrBlueGrayDarker,
              child: Text(
                "AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: clr.clrGrey,
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
              color: clr.clrBlueGrayDarker,
              child: Text(
                "You",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 44,
                  color: clr.clrGrey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 60,
              color: clr.clrTeal,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: clr.clrGrey,
                  textStyle: GoogleFonts.courierPrime(fontSize: 44),
                ),
                onPressed: () {
                  setState(() {
                    selected = 0;
                    gameStatus = " ";
                  });
                },
                child: const Text("New game"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
