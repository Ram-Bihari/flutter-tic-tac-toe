import 'dart:html';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: Link up Images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  String message = '';
  List<String> gameState = [];

  //TODO: initialize the state of the box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  //TODO: play game method

  playGame(int index) {
    if (this.gameState[index] == 'empty') {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = 'cross';
        } else {
          this.gameState[index] = 'circle';
        }
        this.isCross = !this.isCross;
        this.checWin();
      });
    }
  }

  //TODO: reset game
  resetGame() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = '';
    });
  }

  //TODO: get image method
  getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
        break;
    }
  }

  //TODO: check for win logic
  checWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! U SHOULD TEACH YOUR OPPONENT CUZ HE JUST ALLOWED U TO COMPLETE A FULL ROW";
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! U SHOULD TEACH YOUR OPPONENT CUZ HE JUST ALLOWED U TO COMPLETE A FULL ROW";
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! U SHOULD TEACH YOUR OPPONENT CUZ HE JUST ALLOWED U TO COMPLETE A FULL ROW";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! WAS THE OTHER PERSON SLEEPING CUZ YOU JUST COMPLETED A WHOLE COLUMN AND HE DIDN'T DO ANYTHING";
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! WAS THE OTHER PERSON SLEEPING CUZ YOU JUST COMPLETED A WHOLE COLUMN AND HE DIDN'T DO ANYTHING";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! WAS THE OTHER PERSON SLEEPING CUZ YOU JUST COMPLETED A WHOLE COLUMN AND HE DIDN'T DO ANYTHING";
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! DAMN U WON BY FINISHING THE DIAGONAL PART";
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message =
            "${this.gameState[0]} WON! DAMN U WON BY FINISHING THE DIAGONAL PART";
      });
    } else if (!gameState.contains('empty')) {
      this.message = 'Nice try kiddos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bangali Baba Ka TIC TAC TOE'),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,
                      child: MaterialButton(
                        onPressed: () {
                          playGame(i);
                        },
                        child: Image(
                          image: this.getImage(this.gameState[i]),
                        ),
                      ),
                    )),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
              color: Colors.yellow[700],
              minWidth: 30,
              height: 50,
              child: Text(
                'Reset Game',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              splashColor: Colors.black,
              onPressed: () {
                this.resetGame();
              })
        ],
      ),
    );
  }
}
