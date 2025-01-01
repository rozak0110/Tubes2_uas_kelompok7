import 'package:flutter/material.dart';

import 'package:tubes2_uas_kelompok7/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class FavoriteCard extends StatelessWidget {
  final FavouritesResponsesModelGet favorite;
  final VoidCallback onDeleted;

  const FavoriteCard(
      {super.key, required this.favorite, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Favorite id : ${favorite.id}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(height: 10),
            Text(
              "Tanggal Favorite : ${favorite.createdAt}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}