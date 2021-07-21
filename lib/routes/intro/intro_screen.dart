import 'package:flutter/material.dart';
import './components/body.dart';

import 'package:ishop_app/size_config.dart';


class IntroScreen extends StatelessWidget {
  static String routeName = "/intro";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),

    );
  }
}
