import 'package:tubes2_uas_kelompok7/data/breeds/datasource/breeds_datasource.dart';
import 'package:tubes2_uas_kelompok7/data/breeds/responsesmodel/breeds_responses_model.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/requestsmodel/favorite_requests_model.dart';
import 'package:tubes2_uas_kelompok7/data/vote/datasource/vote_datasource.dart';
import 'package:get/get.dart';
import 'package:tubes2_uas_kelompok7/data/vote/requestsmodel/vote_requests_model.dart';

class HomeController extends GetxController {
  final BreedsDatasource _datasource = BreedsDatasource();
  final VoteDatasource _datasourceVote = VoteDatasource();
  final FavoriteDatasource _datasourceFavorite = FavoriteDatasource();
  var images = <BreedsResponsesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      final result = await _datasource.getBreeds();
      images.value = result;
    } catch (e) {
      // PrintLog.printLog('Failed to fetch images: $e');
    }
  }

  void onFavoritePressed(String imageId) {
    final favorite = FavoriteRequestsModel(imageId: imageId, subId: 'test_i1');
    _datasourceFavorite.createFavourites(favorite);
  }

  void onLikePressed(String imageId) {
    final vote =
        VoteRequestsModel(imageId: imageId, subId: 'test_i1', value: 1);
    _datasourceVote.createVote(vote);
  }
}