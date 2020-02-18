
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:test_flutter/entity/MediaObject.dart';
import 'package:test_flutter/navigation/navigator.dart';
import 'package:test_flutter/repository/MediaOdjectsRepository.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeState();

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: CommonThings.size.height,
      //margin: EdgeInsets.only(left: 65.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new MovieListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MovieListWidget extends StatelessWidget {
  int numOfColums = _HomeState._numOfColumns;
  List<MediaObject> data = _HomeState.mediaObjects;


  @override
  Widget build(BuildContext context) {
      return new Container(
        height:CommonThings.size.height,
        margin: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: numOfColums,
          childAspectRatio: 0.7,
          children: getMovieList(context, data),
        ),
      );
  }

  List<Widget> getMovieList(BuildContext context, List<MediaObject> movies) {
    List<Widget> movieList = new List();
    for (int i = 0; i < movies.length; i++) {
      print("Attempt to load: ${movies[i].toString()} \n   - imagePath: ${movies[i].mediaAssets?.imagePaths[2].xDefault}");
      var movieitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
        child: GestureDetector(
          onTap: () => navigateToDetailPage(context, movies[i]),
          child: Container(
          //  height: 220.0,
          // width: 196.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topRight: Radius.circular(20.0),

              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(

            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                child: Image(
                  image: AdvancedNetworkImage(movies[i].mediaAssets?.imagePaths[2].xDefault, useDiskCache: true),
                  width: double.infinity,
                  height:  CommonThings.size.width/(numOfColums+2),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8.0, right: 8.0),
                child: Text(movies[i].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: "SF-Pro-Display-Bold")),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0),
                child: Text(
                    movies[i].mediaAssets?.imagePaths[2].originTag == null ? "" :
                    movies[i].mediaAssets?.imagePaths[2].originTag),
              )
            ],
          ),
        )),
      );
      movieList.add(movieitem);
    }
    return movieList;
  }
}



class CommonThings {
  static Size size;
}


class _HomeState extends State<MyApp> {
  static int _numOfColumns = 3;
  static List<MediaObject> mediaObjects = List();

  static MediaObjectsRepository repository = LocalMediaObjectsRepository();

   getMovies() async {
    mediaObjects = await repository.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    getMovies();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ new MovieListWidget() ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
              setState(() { _numOfColumns = 6 - index; });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFFE52020)),
              title: Text("6 columns", style: TextStyle(color: Color(0xFFE52020)))),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,),
              title: Text("5 columns", style: TextStyle())),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border,),
              title: Text("4 columns",)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text("3 columns"))
        ],
      ),
    );
  }
}