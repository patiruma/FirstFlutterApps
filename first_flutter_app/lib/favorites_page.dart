import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    if (favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Padding(padding: const EdgeInsets.all(20)),
              for (var pair in favorites)
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(pair.asLowerCase),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
