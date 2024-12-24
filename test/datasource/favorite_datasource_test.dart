import 'package:tubes2_uas_kelompok7/core/utils/print_log.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/requestsmodel/favorite_requests_model.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/responsesmodel/favorite_responses_model.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/responsesmodel/favorite_responses_model_delete.dart';
import 'package:tubes2_uas_kelompok7/data/favorite/responsesmodel/favorite_responses_model_get.dart';
import '../responsesmodel/favorite_responses_model_post.dart';
class FavoriteDatasource {
  final HttpManager _httpManager = HttpManager();
  Future<List<FavoritesResponsesModelGet>> getFavorite() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.favoriteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );
      PrintLog.printLog("getFavorite Datasource response: \${response}");
      if (response['statusCode'] == 200 && response.containsKey('data')) {
        final List<dynamic> data = response['data'];
        return data
            .map((item) => FavoritesResponsesModelGet.fromJson(item))
            .toList();
      } else {
        throw Exception('failed to load get Favorite format data');
      }
    } catch (e) {
      throw Exception('failed to load get Favorite');
    }
  }
  Future<FavoritesResponsesModelPost?> createFavorite(
      FavoriteRequestsModelPost data) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.favoriteGetEndpoint,
        method: HttpMethods.post,
        body: data.toJson(),
        useAuth: true,
      );
      if (response['statusCode'] == 200) {
        PrintLog.printLog("createFavorite Datasource response: \${response}");
        return FavoritesResponsesModelPost.fromJson(response['data']);
      } else {
        PrintLog.printLog(
            "createFavorite Datasource response: \${response['statusMessage']}");
        return null;
      }
    } catch (e) {
      throw Exception('failed to load create Favorite');
    }
  }
  Future<FavoritesResponsesModelDelete?> deleteFavorite(int favoriteId) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.favByIdGetEndpoint(favoriteId),
        method: HttpMethods.delete,
        useAuth: true,
      );
      final message = response['message'];
      final statusMessage = response['statusMessage'];
      if (message == 'SUCCESS' || statusMessage == 'OK') {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return FavoritesResponsesModelDelete.fromJson(response['data']);
        } else {
          return FavoritesResponsesModelDelete(
            message: message ?? 'SUCCESS',
            statusMessage: statusMessage ?? 'OK',
          );
        }
      } else {
        PrintLog.printLog(
            "delete Favorite Datasource response: \${statusMessage ?? "Unknown Error"}");
        return null;
      }
    } catch (e) {
      PrintLog.printLog("delete Favorite Datasource response: \$e");
      throw Exception('failed to load delete Favorite');
    }
  }
  Future<FavoritesResponsesModelSearch?> searchFavorite(int favoriteId) async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.favByIdGetEndpoint(favoriteId),
        method: HttpMethods.get,
        useAuth: true,
      );
      if (response['statusCode'] == 200) {
        PrintLog.printLog("searchFavorite Datasource response: \${response}");
        return FavoritesResponsesModelSearch.fromJson(response['data']);
      } else {
        PrintLog.printLog(
            "searchFavorite Datasource response: \${response['statusMessage']}");
        return null;
      }
    } catch (e) {
      throw Exception('failed to load search Favorite');
    }
  }
}