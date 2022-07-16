import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/bloc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myBloc = Provider.of<MyBloc>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: BlocBuilder<MyBloc, MyState>(
                builder: (BuildContext context, state) {
                  if (state is InitialState) {
                    return InitialUI(state.text);
                  } else if (state is ImageState) {
                    return ImageUI(state.url);
                  } else if (state is ContainerState) {
                    return ContainerUI(state.height, state.width, state.color,
                        state.cornerRadius);
                  } else if (state is ListTileState) {
                    return ListTileUI(state.id, state.title);
                  } else {
                    return Text('No UI');
                  }
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      myBloc.add(ImageEvent());
                    },
                    child: Text('Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myBloc.add(ContainerEvent());
                    },
                    child: Text('Container'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myBloc.add(ListTileEvent());
                    },
                    child: Text('ListTile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget InitialUI(String text) {
    return Text(text);
  }

  Widget ImageUI(String url) {
    return Image.network(url);
  }

  Widget ContainerUI(double height, double width, Color color, double radius) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  Widget ListTileUI(int id, String text) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          id.toString(),
        ),
      ),
      title: Text(text),
    );
  }
}
