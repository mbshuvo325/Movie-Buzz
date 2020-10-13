import 'package:moviebuzz/models/movie.dart';

final movies = [
  Movie(
      id: 1,
      name: 'Avangers',
      category: 'Action/Sci-fi',
      releaseDate: 2012,
      rating: 8.2,
      image: 'images/avengers.jpg'),
  Movie(
      id: 2,
      name: 'Captain America',
      category: 'Action/Sci-fi',
      releaseDate: 2011,
      rating: 8.3,
      image: 'images/captainamerica.jpg'),
  Movie(
      id: 3,
      name: 'Captain Marvels',
      category: 'Action/Sci-fi',
      releaseDate: 2018,
      rating: 8.7,
      image: 'images/captainmarvels.jpg'),
  Movie(
      id: 4,
      name: 'Dr. Strange',
      category: 'Action/Sci-fi',
      releaseDate: 2017,
      rating: 8.5,
      image: 'images/drstrange.jpg'),
  Movie(
      id: 5,
      name: 'Iron Man',
      category: 'Action/Sci-fi',
      releaseDate: 2008,
      rating: 8.4,
      image: 'images/ironman.jpg'),
  Movie(
      id: 6,
      name: 'Thor',
      category: 'Action/Sci-fi',
      releaseDate: 2009,
      rating: 8.0,
      image: 'images/thor.jpg'),
];

final List<String> categories = [
  'Action',
  'Action Sci-Fi',
  'Drama',
  'Horror',
  'Thiller',
  'Comedy',
  'Action-Comedy',
  'Horror-Comedy',
];
