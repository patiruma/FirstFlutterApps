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
    // Calculate a sensible card width depending on screen size. Cards will
    // be at most 600px wide and otherwise use 90% of the screen width.
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth < 600 ? screenWidth * 0.9 : 600;

    return Center(
      // SingleChildScrollView + Column with mainAxisSize.min keeps the
      // content centered vertically and horizontally while allowing
      // scrolling if there are many favorites.
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            for (var pair in favorites)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: cardWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 12.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Theme.of(
                                context,
                              ).colorScheme.primaryContainer,
                              size: 28,
                            ),
                            SizedBox(height: 8),
                            Text(
                              pair.asLowerCase,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
