import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishop_app/generated/l10n.dart';
import 'package:ishop_app/routes/home/home.dart';
import 'package:ishop_app/size_config.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
     required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],

      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              SizedBox(
                height:getProportionateScreenHeight(navbarBtnHeight) ,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.home,color: MenuState.home == selectedMenu
                            ? primaryColor
                            : inActiveIconColor,),

                        Text(S.of(context).nav_btn_home_text,style: TextStyle( color: MenuState.home == selectedMenu
                            ? primaryColor
                            : inActiveIconColor),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:getProportionateScreenHeight(navbarBtnHeight) ,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.bag,color: inActiveIconColor),

                        Text(S.of(context).nav_btn_bag_text,style: TextStyle( color: inActiveIconColor),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:getProportionateScreenHeight(navbarBtnHeight) ,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, HomeScreen.routeName),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.person,color: MenuState.profile == selectedMenu
                            ? primaryColor
                            : inActiveIconColor,),

                        Text(S.of(context).nav_btn_account_txt,style: TextStyle( color: inActiveIconColor),)
                      ],
                    ),
                  ),
                ),
              ),


            ],
          )),
    );
  }
}
