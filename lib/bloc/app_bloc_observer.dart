
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * Global bloc oberver. It will print all event and state change
 */
class AppBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

   @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}