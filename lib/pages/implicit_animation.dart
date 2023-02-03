import 'package:flutter/material.dart';

class ImplicitAnimationExample extends StatefulWidget {
  const ImplicitAnimationExample({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationExample> createState() =>
      _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  Color colorContainer = Colors.black;
  double currentFontSize = 15;
  double currentPadding = 15;
  double currentTurn = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones Implicitas'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: currentTurn,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: colorContainer,
                padding: EdgeInsets.all(currentFontSize),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 500),
                  style: TextStyle(fontSize: currentFontSize),
                  child: const Text('Soy un Animated Widget'),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              currentTurn += 1.0 / 8.0;
              if (currentFontSize == 28) {
                colorContainer = Colors.black;
                currentFontSize = 15;
                currentPadding = 15;
              } else {
                colorContainer = Colors.blue;
                currentFontSize = 28;
                currentPadding = 34;
              }
            },
          );
        },
        child: const Icon(Icons.turn_right_outlined),
      ),
    );
  }
}
