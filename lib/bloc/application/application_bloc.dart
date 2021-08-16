import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishop_app/bloc/application/application_event.dart';
import 'package:ishop_app/bloc/application/application_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationBloc extends Bloc<ApplicationEvent,ApplicationState>{
  ApplicationBloc(ApplicationState initialState) : super(initialState);

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    // TODO: implement mapEventToState
       if(event is AppStarted){ // write initalization logic here. like loading login details, appl config, localozation etc. from api
         SharedPreferences prefs = await SharedPreferences.getInstance();
         //check whether use is opening app for first time
         bool? isFirstTIme = await prefs.getBool("first_time");
print("====================  Started");
         if(isFirstTIme != null && !isFirstTIme){
           yield ApplicationBootstrapCompleted();
         }else{
        //   await prefs.setBool("first_time", false);
           yield ApplicationFirstTimeLaunch(); //yea first time
         }

       }
  }

}