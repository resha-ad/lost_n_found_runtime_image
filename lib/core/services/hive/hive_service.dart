import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  // init
  Future<void> inti() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveTableConstant.dbName}';
    Hive.init(path);

    // register adapter
    _registerAdapter();
  }

  // Adapter register
  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)) {
      Hive.registerAdapter(BatchHiveModelAdapter());
    }
  }

  // box open
  Future<void> openBoxes() async {
    await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
  }

  // box close
  Future<void> close() async {
    await Hive.close();
  }

  // ======================= Batch Queries =========================

  Box<BatchHiveModel> get _batchBox =>
      Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);

  // Create batch
  Future<BatchHiveModel> createBatch(BatchHiveModel batch) async {
    await _batchBox.put(batch.batchId, batch);
    return batch;
  }

  List<BatchHiveModel> getAllBatches() {
    return _batchBox.values.toList();
  }

  BatchHiveModel? getBatchById(String batchId) {
    return _batchBox.get(batchId);
  }

  Future<bool> updateBatch(BatchHiveModel batch) async {
    if (_batchBox.containsKey(batch.batchId)) {
      await _batchBox.put(batch.batchId, batch);
      return true;
    }
    return false;
  }

  Future<void> deleteBatch(String batchId) async {
    await _batchBox.delete(batchId);
  }
}
