part of 'bloc_bloc.dart';

@immutable
abstract class Event {}

class InitialEvent extends Event {}

class ImageEvent extends Event {}

class ContainerEvent extends Event {}

class ListTileEvent extends Event {}
