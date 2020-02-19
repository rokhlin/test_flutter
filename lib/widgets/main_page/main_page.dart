import 'package:flutter/material.dart';
import 'package:test_flutter/model/media_object.dart';
import 'package:test_flutter/repository/local_asset_repository.dart';
import 'package:test_flutter/repository/media_objects_repository.dart';
import 'package:test_flutter/widgets/main_page/movie_list_widget.dart';

class MainPage extends StatefulWidget {

  @override
  _HomeState createState() => new _HomeState();
}

class CommonThings {
  static Size size;
}

class _HomeState extends State<MainPage> {
  int _numOfColumns = 3;
  List<MediaObject> _mediaObjects = List();

  final MediaObjectsRepository repository = LocalMediaObjectsRepository();

  getMovies() async {
    if (_mediaObjects.isEmpty) {
      await repository.fetchMovies().then((data) {
        setState(() {
          _mediaObjects = data;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _mediaObjects.isEmpty ? new Container(
      color: Colors.transparent,
      width: 70.0,
      height: 70.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    CommonThings.size = MediaQuery.of(context).size;
    getMovies();
    return Stack(children: <Widget>[
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[ new MovieListWidget(_numOfColumns,_mediaObjects) ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() { _numOfColumns = 4 - index; });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos, color: Color(0xFFE52020)),
                title: Text("4 columns", style: TextStyle(color: Color(0xFFE52020)))),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos,),
                title: Text("3 columns", style: TextStyle())),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos,),
                title: Text("2 columns",)),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_to_photos),
                title: Text("1 column"))
          ],
        ),
      ),
      Align(child: loadingIndicator,alignment: FractionalOffset.center,),
    ],);
  }
}