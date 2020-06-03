import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final double popularity;
  final String date;
  final int heroTag;
  final VoidCallback onTap;

  MovieCard(
      {this.imgUrl,
      this.title,
      this.popularity,
      this.date,
      this.heroTag,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Hero(
                  tag: heroTag,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w185$imgUrl',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
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
                            popularity.toString(),
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
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
                            date,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
