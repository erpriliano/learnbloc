import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/src/bloc/movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learnbloc/src/details_screen.dart';
import 'package:learnbloc/src/ui/movie_card.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn BLoC with API'),
        ),
        body: BlocProvider(
          create: (context) => MovieBloc(httpClient: http.Client())..add(Fetch()),
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieUninitialized) {
                print('state is movie uninitialized');
                return Center(child: CircularProgressIndicator(),);
              }
              if (state is MovieError) {
                print('state is movie error');
                return Center(child: Text('failed to fetch post'),);
              }
              
              if (state is MovieLoaded) {
                print('Movie loaded successfully');
                if(state.result.results.isEmpty) {
                  return Center(child: Text('No posts'),);
                }
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.result.results.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      imgUrl: state.result.results[index].posterPath,
                      title: state.result.results[index].title,
                      popularity: state.result.results[index].popularity,
                      date: state.result.results[index].releaseDate,
                      heroTag: state.result.results[index].id,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(data: state.result.results[index],),)),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}