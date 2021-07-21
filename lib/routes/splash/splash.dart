
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:ishop_app/constants.dart';
import 'package:ishop_app/generated/l10n.dart';
import 'package:ishop_app/size_config.dart';

class SplashScreen extends StatelessWidget{
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: primaryColor ,
      body: SafeArea(

        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(

                  S.of(context).app_name,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  
}