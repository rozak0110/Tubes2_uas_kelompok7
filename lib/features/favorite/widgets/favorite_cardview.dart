import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tubes2_uas_kelompok7/data/breeds/responsesmodel/breeds_responses_model.dart';

class HomeCard extends StatelessWidget {
  final BreedsResponsesModel image;
  final VoidCallback onFavoritePressed;
  final VoidCallback onLikePressed;
  final double borderRadius;

  const HomeCard({
    super.key,
    required this.image,
    required this.onFavoritePressed,
    required this.onLikePressed,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextSection(),
                const SizedBox(height: 8),
                _buildActionSection(),
              ]),
        ));
  }

  Widget _buildTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Kucing : ${image.name}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text('Deskripsi : ${image.description}',
            style: const TextStyle(fontWeight: FontWeight.normal))
      ],
    );
  }

  Widget _buildActionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
          ),
          onPressed: onFavoritePressed,
        ),
        IconButton(
          icon: const Icon(
            Icons.thumb_up,
            color: Colors.white,
          ),
          onPressed: onLikePressed,
        ),
      ],
    );
  }
}