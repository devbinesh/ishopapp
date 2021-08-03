

import 'package:equatable/equatable.dart';

abstract class ApplicationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ApplicationInit extends ApplicationState{}
class ApplicationFirstTimeLaunch extends ApplicationState{}
class ApplicationBootstrapCompleted extends ApplicationState{}
class ApplicationPaused extends ApplicationState{}
class ApplicationExited extends ApplicationState{}