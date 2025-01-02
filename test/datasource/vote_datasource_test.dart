import 'package:tubes2_uas_kelompok7/data/breeds/datasource/breeds_datasource_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kelompok7/data/vote/requestsmodel/vote_requests_model_test.dart';
import 'package:tubes2_uas_kelompok7/data/vote/datasource/vote_datasource_test.dart';

void main() {
  group('Vote DataSource Test', () {
    late VoteDatasource voteDatasource;

    setUp(() {
      voteDatasource = VoteDatasource();
    });
    test("create Vote returns correct data when successful", () async {
      final voteReqModel = VoteRequestsModel(
        imageId: 'abys',
        subId: 'test_i1',
        value: 1
      );
      final response = await voteDatasource.createVote(voteReqModel);
      expect(response?.message, equals('SUCCESS'));
    });
    test("getVote returns correct data when successful", () async {
      final response = await voteDatasource.getVote();
      if (response != null) {
        expect(response.first, isNotNull);
      } else {
        fail("Failed to get Vote");
      }
    });
    test("searchVote returns correct data when successful", () async {
      const voteId = 232504357;

      final response = await voteDatasource.searchVote(voteId);
      expect(response?.id, equals(voteId));
    });
    test("deleteVote returns correct data when successful", () async {
      const voteId = 232504357;

      final response = await voteDatasource.deleteVote(voteId);
      expect(response?.message, equals('SUCCESS'));
    });
  });
}