final String TABLE_MOVIE = 'tbl_movie';
final String MOVIE_COL_ID = 'movie_id';
final String MOVIE_COL_MANE = 'movie_name';
final String MOVIE_COL_CATEGORY = 'movie_category';
final String MOVIE_COL_RELEASEDATE = 'movie_releasedate';
final String MOVIE_COL_RATING = 'movie_rating';
final String MOVIE_COL_IMAGE = 'movie_image';
final String MOVIE_COL_FAV = 'movie_isFavorit';

class Movie {
  int id;
  String name;
  String category;
  int releaseDate;
  double rating;
  String image;
  bool isFavorite;

  Movie({this.id,
      this.name,
      this.category,
      this.releaseDate,
      this.rating,
      this.image,
      this.isFavorite = false
  });

    Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      MOVIE_COL_MANE : name,
      MOVIE_COL_CATEGORY : category,
      MOVIE_COL_RELEASEDATE : releaseDate,
      MOVIE_COL_RATING : rating,
      MOVIE_COL_IMAGE : image,
      MOVIE_COL_FAV : isFavorite ? 1 : 0,
    };
    if(id != null){
      map[MOVIE_COL_ID] = id;
    }
    return map;
  }


  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

  final String MovieUrl = "https://www.youtube.com/watch?v=eOrNdBpGMv8";

  String description = ''' Most movies are made so that they can be shown on screen in Cinemas and at home. 
  After movies are shown in Cinemas for a period of a few weeks or months, they may be marketed through several other medias.
   They are shown on pay television or cable television, and sold or rented on DVD disks or videocassette tapes, 
   so that people can watch the movies at home. You can also download or stream movies. 
   Older movies are shown on television broadcasting stations. 
   A movie camera or video camera takes pictures very quickly, usually at 24 or 25 pictures (frames) every second. 
   When a movie projector, a computer, or a television shows the pictures at that rate, 
   it looks like the things shown in the set of pictures are really moving. 
   Sound is either recorded at the same time, or added later. 
   The sounds in a movie usually include the sounds of people talking (which is called dialogue), 
   music (which is called the "soundtrack"), and sound effects, 
   the sounds of activities that are happening in the movie (such as doors opening or guns being fired). 
   In the 20th century the camera used photographic film. 
   The product is still often called a "film" even though there usually is no film. A screenwriter writes a script, which is the story of the movie with dialogue and things that the actors will say and do. A producer hires people to work on the movie and gets all of the money that will be needed to pay for the actors and the equipment. Producers usually get the money by borrowing it from a bank or by getting investors to lend money to the movie production. Some producers work for a movie studio; other producers are independent (they do not work for a movie studio).

Actors and directors read scripts to find out what to say and what to do. The actors memorize the words from the script that they will say in the movie, and learn the actions that the script tells them to do. Then, the director tells the actors what to do and a cameraman takes motion pictures of them with a motion picture camera.''';
}
