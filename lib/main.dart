import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final imageSize = constraints.biggest.shortestSide * 0.5;
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Center(
              child: _GradientBackdrop(
                color: Colors.blue,
                imageSize: imageSize,
              ),
            ),
            Center(
                child: FlutterLogo(
              size: imageSize / 2,
            ))
          ],
        );
      }),
    );
  }
}

class _GradientBackdrop extends StatelessWidget {
  const _GradientBackdrop({
    required this.imageSize,
    required this.color,
  });

  final double imageSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CircleBackDrop(color: color, imageSize: imageSize),
        _CircleBackDrop(color: color, imageSize: imageSize),
      ],
    );
  }
}

class _CircleBackDrop extends StatelessWidget {
  const _CircleBackDrop({
    required this.imageSize,
    required this.color,
  });

  final double imageSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: imageSize * 0.3,
        sigmaY: imageSize * 0.3,
      ),
      child: Transform.scale(
        scaleX: 1,
        scaleY: 1 / 0.7,
        child: Container(
          height: imageSize,
          width: imageSize,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              stops: const [0.6, 0.8],
              colors: [
                color.withOpacity(0.5 * color.opacity),
                color.withOpacity(0 * color.opacity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
