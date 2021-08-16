
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LocationEvent   extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationFetch extends LocationEvent {}
class LocationInitial extends LocationEvent {}
class LocationChanged extends LocationEvent {
  final BuildContext context;
  LocationChanged(this.context);
}
class LocationChangedOut extends LocationEvent {
}

