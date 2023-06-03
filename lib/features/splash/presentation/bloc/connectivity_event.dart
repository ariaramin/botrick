import 'package:equatable/equatable.dart';

abstract class ConnectivityEvent extends Equatable {}

class CheckConnectivityEvent extends ConnectivityEvent {
  @override
  List<Object?> get props => [];
}
