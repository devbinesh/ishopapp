
import 'package:equatable/equatable.dart';

abstract class ApplicationEvent   extends Equatable {
    @override
    List<Object> get props => [];
}

class AppStarted extends ApplicationEvent {}
class LoggedIn extends ApplicationEvent {

}

class LoggedOut extends ApplicationEvent {}
