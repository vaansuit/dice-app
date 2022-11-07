import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void changeLeftDiceFace() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
    });
  }

  void changeRightDiceFace() {
    setState(() {
      rightDice = Random().nextInt(6) + 1;
    });
  }

  void resetDice() {
    setState(() {
      leftDice = 1;
      rightDice = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Dice App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Click on one of the dice and change its value!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/dice$leftDice.png'),
                  onPressed: () {
                    changeLeftDiceFace();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('assets/dice$rightDice.png'),
                  onPressed: () {
                    changeRightDiceFace();
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              resetDice();
            },
            child: const Text('Reset Dices'),
          ),
        ],
      ),
    );
  }
}
