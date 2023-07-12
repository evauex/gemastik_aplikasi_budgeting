import 'package:flutter/material.dart';
import 'package:gemastik/View/Navbar.dart';
import 'package:get/get.dart';
import 'dart:async';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const Navbar());
    });
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 155, 207),
        body: Center(
          child: Container(
            width: Get.width * 0.5,
            height: Get.width * 0.5,
            child:
                Image(fit: BoxFit.cover, image: AssetImage('images/wallet.png')
                    // Gemastik
                    ),
          ),
        ));
  }
}
