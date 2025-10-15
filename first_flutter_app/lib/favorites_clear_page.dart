import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class FavoritesClearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Are you sure you want to clear all favorites?'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              appState.clearFavorites();
            },
            child: Text('Clear Favorites'),
          ),
        ],
      ),
    );
  }
}
