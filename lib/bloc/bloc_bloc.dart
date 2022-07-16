import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class MyBloc extends Bloc<Event, MyState> {
  String imageUrl =
      'https://images.unsplash.com/photo-1527960669566-f882ba85a4c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';
  double containerHeight = 300;
  double containerWidth = 300;
  double containerCornerRadius = 20;
  Color color = Colors.red;
  int id = 1;
  String title = 'Ahmad';

  MyBloc() : super(InitialState('Loading......')) {
    // on<Event>((event, emit) {
    //
    // });
    on<ImageEvent>(
      (event, emit) => emit.call(
        ImageState(imageUrl),
      ),
    );
    on<ContainerEvent>(
      (event, emit) => emit.call(
        ContainerState(
            containerHeight, containerWidth, color, containerCornerRadius),
      ),
    );
    on<ListTileEvent>(
      (event, emit) => emit.call(
        ListTileState(id, title),
      ),
    );
  }
}
