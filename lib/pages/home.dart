import 'package:flutter/material.dart';

import '../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones en Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: (() => Navigator.of(context)
                    .pushNamed(AppRoutes.implicitAnimation)),
                child: const Text('Animaciones Implicitas')),
            ElevatedButton(
                onPressed: (() =>
                    Navigator.of(context).pushNamed(AppRoutes.transform)),
                child: const Text('Transform')),
            ElevatedButton(
                onPressed: (() =>
                    Navigator.of(context).pushNamed(AppRoutes.tweenExample)),
                child: const Text('Tween')),
            ElevatedButton(
                onPressed: (() => Navigator.of(context)
                    .pushNamed(AppRoutes.explicitAnimation)),
                child: const Text('Animaciones Explicitas')),
          ],
        ),
      ),
    );
  }
}
