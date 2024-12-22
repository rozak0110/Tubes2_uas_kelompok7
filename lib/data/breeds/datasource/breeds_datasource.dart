
import 'package:tubes2_uas_kelompok7/core/api_services/endpoint.dart';
import 'package:tubes2_uas_kelompok7core/utils/print_log.dart';
import 'package:tubes2_uas_kelompok7/data/breeds/responsesmodel/breeds_responses_model.dart';

import '../../../core/api_services/dio_module.dart';

class BreedsDatasource {
  final HttpManager _httpManager = HttpManager();

  Future<List<BreedsResponsesModel>> getBreeds() async {
    try {
      final response = await _httpManager.restRequest(
        url: ApiConstants.breedGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );

      // Printlog.printLog("getImages datasource responses : ${response}"); 

      if (response['statusCode'] == 200) {
        final List<dynamic> data = response['data'];

        if (data is List) {
          return data.map((imageData) => BreedsResponsesModel.fromJson(imageData)).toList();
        } else {
          throw Exception('Data is not a list');
        }
      } else {
        throw Exception('Failed to load breeds : ${response['statusMessage']}');
      }
    } catch (e) {
      throw Exception('Failed to load breeds : $e');
    }
  }
}