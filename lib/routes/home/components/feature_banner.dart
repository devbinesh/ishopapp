
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ishop_app/constants.dart';
import 'package:ishop_app/size_config.dart';

class FeatureBannerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: cardBgColor,
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      height: getProportionateScreenHeight(250.0),
      child: Stack(
        fit: StackFit.expand,
        children: [

           Positioned(
               right: 0,
               top: 45.0,

               child: Image(image: AssetImage('assets/images/deliveryboy.png'),height: getProportionateScreenWidth(120),)

           )  ,
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Text("\u2022 Get things delivered  to \n   your doorstep instantly",softWrap: true,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1,
                  )),
                SizedBox(height: spacerHeight,),
                Text("\u2022 24x7 Support", style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1,
                )),
              SizedBox(height: spacerHeight,),
                Text("\u2022 No Minimum order value\n  on your purchase", style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1,
                ))
             ],
           )
        ],
      ),
    );
  }


}