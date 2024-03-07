/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 28/02/24
 */
import 'package:daily_account/core/constants/icons_constants.dart';
import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:daily_account/features/presentation/blocs/add_data_bloc/add_data_bloc.dart';
import 'package:daily_account/features/presentation/widgets/commonAppbarWithCallback.dart';
import 'package:daily_account/features/presentation/widgets/progress_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HistoryListPage extends StatefulWidget {
  const HistoryListPage({super.key});

  @override
  _HistoryListPageState createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
  final labelReplacements = {
    0: 'Serial No',
    1: 'Date',
    2: 'Name',
    3: 'Description',
    4: 'Amount',
  };

  // List<List<dynamic>>? _sheetData;
  // GSheets? gSheets;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      context.read<AddDataBloc>().add(
            const GetDataEvent(),
          );
      // gSheets = GSheets(credentials);
      // await _fetchData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDataBloc, AddDataState>(
      buildWhen: (currentState, nextState) =>
      currentState.status != nextState.status,
      builder: (context, state) {
        return ProgressErrorWidget(
          isProgressRunning: state.status == AddDataStatusEnum.loading,
          child: Scaffold(
            appBar: CommonAppBarWithCallBack(
              context: context,
              appBarTitle: Utils.getString('financial_track'),

            ),
            body: Center(
              child: state.sheetData == null
                  ? Center(
                child: SvgPicture.asset(IconsConstants.noDataAvailable),
              )
                  : ListView.builder(
                itemCount: state.sheetData!.length,
                itemBuilder: (context, index) {
                  final rowData = state.sheetData![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Create rows for each label-value pair
                          for (var pair in rowData.asMap().entries)
                            Row(
                              children: [
                                Text(
                                  // Use replacement label if available, else default to 'Label ${pair.key + 1}'
                                  labelReplacements[pair.key] ??
                                      'Label ${pair.key + 1}:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  pair.value.toString(),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<void> _fetchData() async {
  //   final data = await fetchSheetData();
  //   setState(() {
  //     _sheetData = data;
  //   });
  // }
  //
  // Future<List<List<dynamic>>?> fetchSheetData() async {
  //   final ss = await gSheets?.spreadsheet(spreadsheetId);
  //   final sheet = ss?.worksheetByTitle(sheetTitle);
  //   final data = await sheet?.values.allRows();
  //
  //   // No need to convert date strings to DateTime objects here
  //   return data;
  // }



}
