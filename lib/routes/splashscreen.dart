import 'dart:io';

import 'package:asn_flutter/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Lottie.asset(
          'assets/animations/asn.json',
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() =>
                  Get.to(() => Homepage(), transition: Transition.downToUp));
          },
        )),
      ),
    );
  }
}
