import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebuzz/models/movie.dart';
import 'package:moviebuzz/pages/details_page.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  MovieItem(this.movie);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(widget.movie.id)));
      },
      child: Card(
        color: Colors.blue.shade800,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: widget.movie.id,
                    child: Image.asset(widget.movie.image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                    top: 20,
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      padding: EdgeInsets.all(10),
                      child: Text(
                  widget.movie.name,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.movie.releaseDate}',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.movie.category,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.movie.rating}',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(widget.movie.isFavorite ? Icons.favorite : Icons.favorite_border,color: Colors.white,),
                    onPressed: (){
                     setState(() {
                       widget.movie.isFavorite =! widget.movie.isFavorite;
                     });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
