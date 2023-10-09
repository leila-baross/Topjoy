import 'dart:js';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constants;

class HomeViewController extends GetxController {
  BuildContext context;
  HomeViewController(this.context);

  bool isInitialized=false;

  int bottlecapState = 0;
  int random = 0;

  String giveMeMessage() {
    return (bottlecapState == 10)
        ? constants.messages[random].toUpperCase()
        : "";
  }

  void flipTheBottlecap() async {
    bool condition = (bottlecapState == 0);
    random = Random().nextInt(constants.messages.length);

    for (int i = (condition) ? 0 : 10;
        (condition) ? i < 11 : i >= 0;
        (condition) ? i++ : i--) {
      bottlecapState = i;
      Future.delayed(
        Duration(milliseconds: 15),
      );
      update();
    }
  }

  Future<void> preloadAllImage() async{
    for (int i = 0; i < 11; i++) {
      await precacheImage(AssetImage('images/bottlecap_$i.png'), context);
    }
  }

@override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await preloadAllImage();
    isInitialized=true;
   // await Future.delayed(Duration(milliseconds: 2000));
    update();
  }

}
