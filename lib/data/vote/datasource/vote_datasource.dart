<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
import 'package:tubes2_uas_kelompok7/core/api_services/dio_module.dart';
import 'package:tubes2_uas_kelompok7/core/api_services/endpoint.dart';
import 'package:tubes2_uas_kelompok7/data/vote/responsesmodel/vote_responses_model_delete.dart';
import 'package:tubes2_uas_kelompok7/data/vote/responsesmodel/vote_responses_model_get.dart';
import 'package:tubes2_uas_kelompok7/data/vote/responsesmodel/vote_responses_model_post.dart';
import 'package:tubes2_uas_kelompok7/data/vote/requestsmodel/vote_requests_model.dart';
import 'package:tubes2_uas_kelompok7/data/vote/responsesmodel/vote_responses_model.dart';

class FavoriteDatasource {
  final HttpManager httpManager = HttpManager();

  Future<List<VoteResponsesModelGet>> getVote() async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );
      // PrintLog.printLog("getVote datasource responses : ${response}");
      if (response['statusCode'] == 200) {
        final List<dynamic> data = response['data'];
        return data.map((item) {
          if (item['image'] == null || item['image'].isEmpty) {
            item['image'] = {
              'id': "",
              'url': "",};
              }
          return VoteResponsesModelGet.fromJson(item);
      }).toList();
        } else {
        throw Exception(
            'Failed to load vote : ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception('Failed to load getvote: $e');
    }
  }

  Future<VoteResponsesModelPost?> createVote(
      VoteRequestsModel data) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.post,
        useAuth: true,
        body: data.toJson(),
      );
      final statusMessage = response['statusMessage'];
      // PrintLog.printLog("getVote datasource responses : ${response}");
      if (response['statusCode'] == 200 || response['statusCode'] == 201) {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return VoteResponsesModelPost.fromJson(response['data']);
        } else {
          return VoteResponsesModelPost(
            message: statusMessage ?? "SUCCESS",
            id : 0,
            imageId: '',
            subId: '',
            value: 0,
            countryCode: '',
          );
        }
      } else {
        throw Exception ('Failed to load vote : ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception('Failed to load vote: $e');
    }
  }

  Future<VoteResponsesModelDelete?> deleteVote(
      int voteId) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favByIdGetEndpoint(voteId),
        method: HttpMethods.delete,
        useAuth: true,
      );
      final message = response['message'];
      final statusMessage = response['statusMessage'];

      if (message == 'SUCCESS' || statusMessage == "OK") {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return VoteResponsesModelDelete.fromJson(response['data']);
        } else {
          return VoteResponsesModelDelete(message: message ?? "SUCCESS");
        }
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to load vote: $e');
    }
  }
  Future<VoteResponsesModelSearch?> searchVote(int voteId) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.favByIdGetEndpoint(voteId),
        method: HttpMethods.get,
        useAuth: true,
      );
      if (response['statusCode'] == 200) {
        return VoteResponsesModelSearch.fromJson(response['data']);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to load vote: $e');
    }
  }
}