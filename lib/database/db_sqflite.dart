
import 'package:moviebuzz/models/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
class DBSQFliteHelper{
 static final String CREATE_TABLE_MOVIE = '''create table $TABLE_MOVIE(
 $MOVIE_COL_ID integer primary key autoincrement,
 $MOVIE_COL_MANE text not null,
 $MOVIE_COL_CATEGORY text not null,
 $MOVIE_COL_RELEASEDATE integer not null,
 $MOVIE_COL_RATING real not null,
 $MOVIE_COL_IMAGE text not null,
 $MOVIE_COL_FAV integer not null)''';

 static Future<Database> open() async{
   final rootpath = await getDatabasesPath();
   final dbpath = path.join(rootpath,'movie_db');
   return openDatabase(dbpath, version: 1,onCreate: (db, version) async{
    await db.execute(CREATE_TABLE_MOVIE);
   });
 }

 static Future<int> insertMovie(Movie movie) async{
   final db = await open();
   return db.insert(TABLE_MOVIE, movie.toMap());
 }

}