import 'package:film_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Movie {
  final Image image;
  final String name;
  final double rating;
  final String duration;
  final String genre;
  final String synopsis;

  Movie({
    required this.image,
    required this.name,
    required this.rating,
    required this.duration,
    required this.genre,
    required this.synopsis,
  });
}

List<Movie> movies = [
  Movie(
    image: Assets.images.batman.image(),
    name: 'The Dark Knight',
    rating: 4.5,
    duration: '2h',
    genre: 'Action',
    synopsis: 'Gotham City is once again plagued by crime, but this time, '
        'there is a new and terrifying threat: the Joker (played by Heath '
        'Ledger), a deranged criminal with no clear motives other than creating'
        ' chaos and anarchy in the city. Batman (played by Christian Bale) '
        'must confront the Joker, who threatens the city with heinous acts'
        ' of terror.',
  ),
  Movie(
    image: Assets.images.transformer.image(),
    name: 'Transformers',
    rating: 4.0,
    duration: '2h 30m',
    genre: 'Action',
    synopsis: 'The story begins with the discovery of an ancient artifact, '
        'the AllSpark Cube, on Cybertron, the home planet of the Transformers. '
        'This powerful device is the source of life for the Autobots and '
        'Decepticons, two warring factions of shape-shifting robots. '
        'The Autobots are the defenders of peace, while the Decepticons '

  ),
  Movie(
    image: Assets.images.radius.image(),
    name: 'Radius',
    rating: 4.0,
    duration: '2h 30m',
    genre: 'Thriller',
    synopsis:
        'The film opens with Liam (played by Diego Klattenhoff) awakening '
        'from a car crash with amnesia. He does not remember anything about '
        'himself, the accident, or how he ended up in this situation. '
        'As he stumbles away from the crash site, he discovers that anyone '
        'who comes within a certain proximity to him dies instantly.',
  ),
  Movie(
      image: Assets.images.pirates.image(),
      name: 'Pirates of the Caribbean',
      rating: 4.0,
      duration: '2h 30m',
      genre: 'Adventure',
      synopsis: 'The film follows the adventures of Captain Jack Sparrow '
          '(played by Johnny Depp), an eccentric and cunning pirate who is on a '
          'quest to reclaim his stolen pirate ship, the Black Pearl, which was taken'
          ' by his former mutinous crew. However, the Black Pearl and its crew are'
          ' under a terrible curse '),
];
