
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop_app/bloc/location/location_bloc.dart';
import 'package:ishop_app/bloc/location/location_state.dart';
import 'package:ishop_app/components/coustom_bottom_nav_bar.dart';
import 'package:ishop_app/constants.dart';
import 'package:ishop_app/data/model/currentlocation.dart';
import 'package:ishop_app/enums.dart';
import 'package:ishop_app/generated/l10n.dart';
import 'package:ishop_app/routes/home/components/body.dart';
import 'package:ishop_app/size_config.dart';

class HomeScreen extends StatelessWidget{
  static String routeName = "/home";
  _appBar(context,height) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+80 ),
    child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(18.0),// Background
          child:


          Row(
            children: [
            Expanded(

             child:
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => print("hi"),
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children:   <Widget>[
                        Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 24.0,
                          semanticLabel: 'Click to change location',
                        ),
                        BlocBuilder<LocationBloc, LocationState>(
                        builder: (context, location) {
                          if (location is LocationChanged) {
                            return locationExpanded(location.currentLocation);
                          }
                          else if(location is LocationInit)
                            {
                              return locationExpanded(location.currentLocation);
                            }
                          else
                            {
                              return locationExpanded(location.currentLocation);
                            }
                        })
                      ],
                    ),
                  ),
                )

              ) ,
              Material(

              color: Colors.transparent,
              child: InkWell(
                            borderRadius: BorderRadius.circular(50.0),
                            onTap: ()=> {},
                            child: Container(
                              width: 54.0,
                              height: 60.0,

                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                 Icon( Icons.shopping_bag,color: Colors.white,
                                   size: 24.0,),
                                  Positioned(
                                    top: 10,
                                    left: 24.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                      alignment: Alignment.center,
                                      child: Text('', style: TextStyle(fontSize: 12.0,
                                          color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
              )
            ],
          ),
          color:Theme.of(context).primaryColor,
          height: height+75,
          width: MediaQuery.of(context).size.width,
        ),

        Container(),   // Required some widget in between to float AppBar

        Positioned(    // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.menu, color: Theme.of(context).primaryColor,),
            primary: false,
            title: TextField(
                decoration: InputDecoration(
                    hintText: S.of(context).home_search_placeholder,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Theme.of(context).primaryColor), onPressed: () {},),
              IconButton(icon: Icon(Icons.notifications, color: Theme.of(context).primaryColor),
                onPressed: () {},)
            ],
          ),
        )

      ],
    ),
  );

  Expanded locationExpanded(CurrentLocation location) {
    return Expanded(child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${location.locationName}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),),
                          Text('${location.locationAddress}', overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0,
                              color: Colors.white),),
                        ],
                      ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(

      appBar: _appBar(context, AppBar().preferredSize.height),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
  Widget appBar() {
    return SizedBox(

      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        ],
      ),
    );
  }

}