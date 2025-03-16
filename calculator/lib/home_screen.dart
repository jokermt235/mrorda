import 'package:flutter/material.dart';

import './styled_button.dart';
import './evaluate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  // These are the buttons that will be displayed on the calculator
  var buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '',
    '0',
    '.',
    '='
  ];
  var userInput = '';
  var finalResult = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Display part of the Calculator
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Input from User
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 21, color: Colors.white),
                ),
              ),
              // Answer to the Calculation
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: Text(
                  finalResult,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        // Buttons Part of the Calculator
        Expanded(
          flex: 2,
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: buttons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 15, crossAxisSpacing: 15),
            itemBuilder: (BuildContext context, int index) {
              // When button is 'AC'
              if (index == 0) {
                return StyledButton(
                    bgColor: const Color.fromARGB(255, 174, 174, 174),
                    textColor: Colors.black,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        userInput = '';
                        finalResult = '';
                      });
                    });
              }
              // When Button is 'DEL'
              else if (index == 1) {
                return StyledButton(
                    bgColor: const Color.fromARGB(255, 174, 174, 174),
                    textColor: Colors.black,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                      });
                    });
              }
              //When Button is '%'
              else if (index == 2) {
                return StyledButton(
                    bgColor: const Color.fromARGB(255, 174, 174, 174),
                    textColor: Colors.black,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        userInput += buttons[index];
                      });
                    });
              }
              // When Button is '/' , 'x', '-', '+'
              else if (index == 3 || index == 7 || index == 11 || index == 15) {
                return StyledButton(
                    bgColor: Colors.orangeAccent,
                    textColor: Colors.white,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        userInput += buttons[index];
                      });
                    });
              }
              // When Button is '='
              else if (index == 19) {
                return StyledButton(
                    bgColor: Colors.orangeAccent,
                    textColor: Colors.white,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        finalResult = evaluate(userInput);
                      });
                    });
              }
              // For the remaining buttons
              else {
                return StyledButton(
                    bgColor: const Color.fromARGB(221, 52, 51, 51),
                    textColor: Colors.white,
                    text: buttons[index],
                    func: () {
                      setState(() {
                        userInput += buttons[index];
                      });
                    });
              }
            },
          ),
        ),
      ],
    );
  }
}
