import 'package:flutter/material.dart';
import 'View/Loading.Screen.dart';
import 'package:get/get.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen()
    );
  }
}
