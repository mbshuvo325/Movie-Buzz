import 'package:flutter/material.dart';
import 'package:moviebuzz/database/temp_db.dart';
import 'package:moviebuzz/models/movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayMovie extends StatefulWidget {
  final int id;
  PlayMovie(this.id);

  @override
  _PlayMovieState createState() => _PlayMovieState();
}

class _PlayMovieState extends State<PlayMovie> {
  var movie = Movie();
  String url = "https://www.youtube.com/watch?v=eOrNdBpGMv8";
  YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final movie = movies.firstWhere((movie) => movie.id == widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Playing'+' '+movie.name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: movie.id,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
