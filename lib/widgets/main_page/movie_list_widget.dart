

import 'package:flutter/material.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/widgets/main_page/main_page.dart';
import 'package:test_flutter/widgets/movie_item.dart';

class MovieListWidget extends StatelessWidget {
  final int numOfColums;
  final List<MediaObject> data;


  MovieListWidget(this.numOfColums, this.data);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height:CommonThings.size.height,
      margin: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: numOfColums,
        childAspectRatio: 0.7,
        children: getMovieList(context, data, numOfColums),
      ),
    );
  }

  List<Widget> getMovieList(BuildContext context, List<MediaObject> movies, int numOfColums) {
    List<Widget> movieList = new List();
    for (int i = 0; i < movies.length; i++) {
      print("Attempt to load: ${movies[i].toString()} \n   - imagePath: ${movies[i].mediaAssets?.imagePaths[2].xDefault}");
      var movieItem = MovieItem(movies[i], numOfColums);
      movieList.add(movieItem);
    }
    return movieList;
  }
}