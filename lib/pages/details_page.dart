import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebuzz/database/temp_db.dart';
import 'package:moviebuzz/pages/movie_player.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  MovieDetails(this.id);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final movie = movies.firstWhere((movie) => movie.id == widget.id);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.name,style: TextStyle(fontSize: 20,color: Colors.white),),
              background: Hero(
                tag: movie.id,
                  child: Image.asset(movie.image,fit: BoxFit.cover,)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(movie.name,style: TextStyle(fontSize: 30),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(movie.category,style: TextStyle(fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.play_circle_outline,color: Colors.blue.shade800,size: 35),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayMovie(movie.id)));
                        },
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: IconButton(
                       icon: Icon(Icons.arrow_downward,color: Colors.blue.shade800,size: 35,),
                       onPressed: (){

                       },
                     ),
                   )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(movie.description,style: TextStyle(fontSize: 10),),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
