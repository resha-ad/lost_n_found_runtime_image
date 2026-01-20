import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/api/api_client.dart';
import 'package:lost_n_found/core/api/api_endpoints.dart';
import 'package:lost_n_found/features/batch/data/datasources/batch_datasource.dart';
import 'package:lost_n_found/features/batch/data/models/batch_api_model.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';

final batchRemoteProvider = Provider<IBatchRemoteDataSource>((ref) {
  return BatchRemoteDataSource(apiClient: ref.read(apiClientProvider));
});

class BatchRemoteDataSource implements IBatchRemoteDataSource {
  final ApiClient _apiClient;

  BatchRemoteDataSource({required ApiClient apiClient})
    : _apiClient = apiClient;

  @override
  Future<bool> createBatch(BatchHiveModel batch) async {
    final response = await _apiClient.post(ApiEndpoints.batches);
    return response.data['success'] == true;
  }

  @override
  Future<List<BatchApiModel>> getAllBatches() async {
    final response = await _apiClient.get(ApiEndpoints.batches);
    final data = response.data['data'] as List;
    //json -> api model -> entity : from Json
    //entity -> api model -> adapter : toJson
    return data.map((json) => BatchApiModel.fromJson(json)).toList();
  }

  @override
  Future<BatchApiModel?> getBatchById(String batchId) {
    // TODO: implement getBatchById
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBatch(BatchHiveModel batch) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }
}
