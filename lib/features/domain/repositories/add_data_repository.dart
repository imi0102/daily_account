/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */
import 'package:daily_account/core/resources/data_state/data_state.dart';

abstract class AddDataRepository {
  Future<DataState<bool?>> submitData({required List<String> rowData});

  Future<DataState<List<List<dynamic>>?>> getHistoryData();
}
