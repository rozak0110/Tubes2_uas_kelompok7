import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kelompok7/data/vote/responsesmodel/vote_responses.dart';
class VoteCardview extends StatelessWidget {
  final VoteResponsesModelGet vote;
  final VoidCallback onDeleted;
  const VoteCardview({super.key, required this.vote, required this.onDeleted});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Id Vote : ${vote.id}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "id User : ${vote.imageId}",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes2_uas_kelompok7/core/global_component/searchview.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.searchResult.isEmpty) {
                  return const Center(child: Text('No favorites found.'));
                } else {
                  return _buildFavoriteList(controller);
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.fetchFavorite();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kucing Favorite',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your favorite list cat',
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildFavoriteList(FavoriteController controller) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: controller.searchResult.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final favorite = controller.searchResult[index];
          return FavoriteCard(
            favorite: favorite,
            onDeleted: () {
              controller.searchResult.removeAt(index);
            },
          );
        },
      ),
    );
  }
}
class FavoriteCard extends StatelessWidget {
  final String favorite;
  final VoidCallback onDeleted;
  const FavoriteCard({
    Key? key,
    required this.favorite,
    required this.onDeleted,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(favorite),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDeleted,
        ),
      ),
    );
  }
}