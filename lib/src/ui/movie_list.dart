import 'package:blockproject/src/bloc/movies_bloc.dart';
import 'package:blockproject/src/models/item_model.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.addMoviesToSink();
    return Scaffold(
      appBar: AppBar(title: Text("Popular Movies")),
      body: StreamBuilder<ItemModel>(
          stream: bloc.allMoviesFromStream,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
  return GridView.builder(
      itemCount: snapshot.data!.results!.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, int index) {
        return Image.network(
          'https://image.tmdb.org/t/p/w185${snapshot.data!.results![index].posterPath}',
          fit: BoxFit.cover,
        );
      });
}
