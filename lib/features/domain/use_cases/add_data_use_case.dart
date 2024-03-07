import 'package:daily_account/core/resources/data_state/data_state.dart';
import 'package:daily_account/features/domain/repositories/add_data_repository.dart';

/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 29/02/24
 */
class AddDataUseCase {
  AddDataRepository addDataRepository;

  AddDataUseCase(this.addDataRepository);

  Future<DataState<bool?>> submitData({required List<String> params}) async {
    return await addDataRepository.submitData(rowData: params);
  }

  Future<DataState<List<List<dynamic>>?>> getHistoryData() async {
    return await addDataRepository.getHistoryData();
  }
}
