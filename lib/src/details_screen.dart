import 'package:flutter/material.dart';
import 'package:learnbloc/src/model/movie-model.dart';

class DetailsScreen extends StatelessWidget {
  final Movie data;

  DetailsScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn BLoC with API'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height * .4,
            child: Hero(
              tag: data.id,
              child: Container(
                child: Image.network(
                  'https://image.tmdb.org/t/p/w185${data.posterPath}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    data.releaseDate,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            data.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.stars,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    data.popularity.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.thumb_up,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    data.voteCount.toString(),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.subtitles,
                    size: 14,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    data.originalLanguage.toUpperCase(),
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8.0)),
            child: Text(data.overview),
          ),
        ],
      ),
    );
  }
}
