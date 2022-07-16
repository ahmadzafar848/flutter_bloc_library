part of 'bloc_bloc.dart';

@immutable
abstract class MyState {}

class InitialState extends MyState {
  final String text;
  InitialState(this.text);
}

class ImageState extends MyState {
  final String url;
  ImageState(this.url);
}

class ContainerState extends MyState {
  final double height;
  final double width;
  final Color color;
  final cornerRadius;
  ContainerState(this.height, this.width, this.color, this.cornerRadius);
}

class ListTileState extends MyState {
  final int id;
  final String title;
  ListTileState(this.id, this.title);
}
