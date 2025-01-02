import 'package:get/get.dart';
import 'package:tubes2_uas_kel4/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kelompok0/data/favorite/responsesmodel/favorite_responses_model_get.dart';

class FavoriteController extends GetxController {
  final FavoriteDatasource _datasource = FavoriteDatasource();
  RxList<FavoritesResponsesModelGet> favorites = <FavoritesResponsesModelGet>[].obs;
  RxList<FavoritesResponsesModelGet> searchResults = <FavoritesResponsesModelGet>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchFavorite();
  }

  Future<void> fetchFavorite() async {
    isLoading.value = true;
    try {
      final result = await _datasource.getFavorite();
      if (result != null) {
        favorites.value = result;
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void searchFavorite(String query) {
    if (query.isEmpty) {
      searchResults.value = favorites;
    } else {
      searchResults.value =
          favorites.where((element) => element.id.toString().toLowerCase().contains(query.toLowerCase())).toList();
    }
  }

  Future<void> deleteFavorite(int id) async {
    try {
      final result = await _datasource.deleteFavorite(id);
      if (result != null) {
        favorites.removeWhere((element) => element.id == id);
        searchResults.removeWhere((element) => element.id == id);
      }
    } catch (e) {
      PrintLog.printLog("Error delete favorite: $e");
    }
  }
}
