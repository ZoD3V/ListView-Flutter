import 'package:tugas_5/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(movie.imageUrl),
            ),
            title: Text(movie.title),
            subtitle: Text(movie.genre),
            trailing: Text(movie.year),
          )
        ],
      ),
    );
  }
}
