/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 11/01/24
 */

import 'package:daily_account/core/constants/api_constants.dart';
import 'package:daily_account/core/resources/data_state/data_state.dart';
import 'package:daily_account/core/resources/exception/app_exception.dart';
import 'package:daily_account/features/data/data_sources/add_data_api_services.dart';
import 'package:daily_account/features/domain/repositories/add_data_repository.dart';
import 'package:gsheets/src/gsheets.dart';

class AddDataRepositoryImpl implements AddDataRepository {
  final AddDataApiServices _addDataApiServices;

  AddDataRepositoryImpl(
    this._addDataApiServices,
  );

  @override
  Future<DataState<bool?>> submitData({required List<String> rowData}) async {
    try {
      final sheetData = await _addDataApiServices
          .googleSheetClient(APIConstants.expenseSheet);
      final existingTitle = await sheetData?.values.row(1);
      if (existingTitle == null || existingTitle.isEmpty) {
        // If the title row doesn't exist, add it
        await sheetData?.values.insertRow(
            1, ['Serial No', 'Name', 'Date', 'Description', 'Amount']);
      }

      final lastIndex = await getLastIndex(sheetData);
      final newIndex = lastIndex + 1;
      rowData.insert(
          0, newIndex.toString()); // Insert the index at the beginning

      // Find the last row to insert the new entry
      final lastRow = await sheetData?.values.row(lastIndex + 1);
      int insertRowIndex =
          (lastRow != null && lastRow.isNotEmpty) ? lastIndex + 1 : lastIndex;

      bool? isInserted =
          await sheetData?.values.insertRow(insertRowIndex + 1, rowData);

      if (isInserted == true) {
        return DataSuccess(isInserted);
      } else {
        return DataFailure(AppException(isInserted));
      }
    } catch (e) {
      return DataFailure(AppException(e));
    }
  }

  Future<int> getLastIndex(Worksheet? sheetData) async {
    // Find the last row with values in the sheet
    final lastRowIndex = await sheetData?.values.column(1);
    if (lastRowIndex != null && lastRowIndex.isNotEmpty) {
      // Extract the index from the last row
      final lastIndex = int.tryParse(lastRowIndex.last) ?? 0;
      return lastIndex;
    } else {
      return 0; // Start from 0 if the sheet is empty
    }
  }

  @override
  Future<DataState<List<List<dynamic>>?>> getHistoryData() async {
    try {
      final sheetData = await _addDataApiServices
          .googleSheetClient(APIConstants.expenseSheet);
      var data = await sheetData?.values.allRows();

      if (data != null && data.isNotEmpty) {
        data = data.sublist(1);
        return DataSuccess(data);
      } else {
        return DataFailure(AppException(data));
      }
    } catch (e) {
      return DataFailure(AppException(e));
    }
  }
}
