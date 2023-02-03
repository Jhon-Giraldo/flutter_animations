import 'package:flutter/material.dart';

class TransformWidgetExample extends StatefulWidget {
  const TransformWidgetExample({Key? key}) : super(key: key);

  @override
  State<TransformWidgetExample> createState() => _TransformWidgetExampleState();
}

class _TransformWidgetExampleState extends State<TransformWidgetExample> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform'),
        centerTitle: true,
      ),
      body: Center(
        child: Transform(
          // Transform widget
          transform: Matrix4.identity()
            ..setEntry(2, 3, 0.005) // perspective
            ..rotateX(0.01 * offset.dx) // changed
            ..rotateY(0.01 * offset.dy), // changed
          alignment: FractionalOffset.center,
          child: GestureDetector(
            // new
            onPanUpdate: (details) => setState(() => offset += details.delta),
            onDoubleTap: () => setState(() => offset = Offset.zero),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/orden_fenix.png'),
                  height: 310,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  offset.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
