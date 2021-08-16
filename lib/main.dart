import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ishop_app/bloc/application/application_bloc.dart';
import 'package:ishop_app/bloc/application/application_event.dart';
import 'package:ishop_app/bloc/application/application_state.dart';
import 'package:ishop_app/data/api/application_repository.dart';
import 'package:ishop_app/generated/l10n.dart';
import 'package:ishop_app/routes/home/home.dart';
import 'package:ishop_app/routes/intro/intro_screen.dart';
import 'package:ishop_app/routes/splash/splash.dart';
import 'package:ishop_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/location/location_bloc.dart';
import 'bloc/location/location_event.dart';
import 'bloc/location/location_state.dart';
import 'package:ishop_app/data/model/currentlocation.dart';

void main() {
  /**
   * Registering global bloc here . It will be avaliable to all children down
   * Init with app init state and a
   */
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) {
            return ApplicationBloc(ApplicationInit())..add(AppStarted());
          },
        ),
        BlocProvider<LocationBloc>(
            create: (context) => LocationBloc(LocationInit())..add(LocationInitial())..add(LocationFetch())
        )
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context){ return ApplicationRepository(); }) //application repo for global purpose
        ],
        child:const MyApp(),
      ) ,
  )
      
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      title: "Essentia",
      debugShowCheckedModeBanner: false,
      localizationsDelegates:[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      //locale:  Locale('ml'),
      theme: theme(),
      routes:_registerRoutes(),
      home: BlocBuilder<ApplicationBloc,ApplicationState>(
        builder:  (context,state)   {


          if(state is ApplicationFirstTimeLaunch){
              return IntroScreen();
            }else if(state is ApplicationBootstrapCompleted){
              return HomeScreen( );
            }else{
              return SplashScreen(); //show loading unitl app launch
            }
        },
      ) ,
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      SplashScreen.routeName: (context) => SplashScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      IntroScreen.routeName: (context) => IntroScreen(),

    };
  }
}

