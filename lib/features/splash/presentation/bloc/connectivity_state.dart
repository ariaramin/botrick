import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable {}

class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object?> get props => [];
}

class ConnectivityUpdated extends ConnectivityState {
  final bool isConnected;

  ConnectivityUpdated(this.isConnected);

  @override
  List<Object?> get props => [isConnected];
}
