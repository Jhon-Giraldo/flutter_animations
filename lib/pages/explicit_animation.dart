import 'package:flutter/material.dart';

class ExplicitAnimationExample extends StatefulWidget {
  const ExplicitAnimationExample({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationExample> createState() =>
      _ExplicitAnimationExampleState();
}

class _ExplicitAnimationExampleState extends State<ExplicitAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedContoller;
  late Animation<Color?> colorTweenAnimation;
  double currentAngle = 0.0;
  Color currentColor = Colors.blueAccent;
  late Animation<double> rotateAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animatedContoller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    colorTweenAnimation =
        ColorTween(begin: Colors.blueAccent, end: Colors.deepPurple).animate(
      CurvedAnimation(
        parent: animatedContoller,
        curve: const Interval(0, 1.0),
      ),
    );
    rotateAnimation = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: animatedContoller,
        curve: const Interval(0, 1.0),
      ),
    );
    sizeAnimation = Tween<double>(begin: 143, end: 243).animate(
      CurvedAnimation(
        parent: animatedContoller,
        curve: const Interval(0, 1.0),
      ),
    );
    animatedContoller.repeat(reverse: true);
    animatedContoller.addListener(
      () {
        setState(
          () {
            currentColor = colorTweenAnimation.value!;
            currentAngle = rotateAnimation.value;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    animatedContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones Explícitas'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: rotateAnimation.value,
              child: Image(
                image: const AssetImage('assets/logo_fenix.png'),
                color: colorTweenAnimation.value,
                height: sizeAnimation.value,
              ),
            ),
            Center(
              child: Text(
                '🤯 AnimatedController 🤯',
                style:
                    TextStyle(color: colorTweenAnimation.value, fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
