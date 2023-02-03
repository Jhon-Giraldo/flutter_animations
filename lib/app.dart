import 'package:flutter/material.dart';

import 'pages/explicit_animation.dart';
import 'pages/home.dart';
import 'pages/implicit_animation.dart';
import 'pages/transform_widget.dart';
import 'pages/tween_animation_builder_example.dart';
import 'routes/routes.dart';

class AppAnimated extends StatelessWidget {
  const AppAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case (AppRoutes.transform):
            return MaterialPageRoute(
                builder: ((context) => const TransformWidgetExample()));
          case (AppRoutes.implicitAnimation):
            return MaterialPageRoute(
                builder: ((context) => const ImplicitAnimationExample()));
          case (AppRoutes.tweenExample):
            return MaterialPageRoute(
                builder: ((context) => const TweenAnimationBuilderExample()));
          case (AppRoutes.explicitAnimation):
            return MaterialPageRoute(
                builder: ((context) => const ExplicitAnimationExample()));
          default:
            return MaterialPageRoute(builder: ((context) => const HomePage()));
        }
      },
    );
  }
}
