import 'package:daily_account/core/resources/utility/utils.dart';
import 'package:daily_account/features/presentation/blocs/add_data_bloc/add_data_bloc.dart';
import 'package:daily_account/features/presentation/pages/history_list_page.dart';
import 'package:daily_account/features/presentation/widgets/commonAppbarWithCallback.dart';
import 'package:daily_account/features/presentation/widgets/progress_error_widget.dart';
import 'package:daily_account/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsheets/gsheets.dart';

/**
 * Created by Imtiyazaehmad Parasara.
 * Date: 29/02/24
 */
class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  GSheets? gSheets;
  DateTime? _selectedDate = DateTime.now();

  /// Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      gSheets = GSheets(credentials);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDataBloc, AddDataState>(
      buildWhen: (currentState, nextState) =>
          currentState.status != nextState.status,
      builder: (context, state) {
        return ProgressErrorWidget(
          isProgressRunning: state.status == AddDataStatusEnum.loading,
          child: SafeArea(
            child: Scaffold(
              appBar: CommonAppBarWithCallBack(
                context: context,
                appBarTitle: Utils.getString('add_record'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(_selectedDate == null
                          ? 'Select Date'
                          : Utils.getDateTimeFormat(_selectedDate.toString(),
                              Utils.dateFormatdefault)),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () async {
                        final rowData = [
                          _selectedDate.toString(),
                          _nameController.text,
                          _descriptionController.text,
                          _amountController.text
                        ]; // Your data here

                        context.read<AddDataBloc>().add(
                              SubmitDataEvent(
                                rowData,
                              ),
                            );

                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: false,
                        //   // Prevent user from dismissing the dialog
                        //   builder: (BuildContext context) {
                        //     return const AlertDialog(
                        //       content: Row(
                        //         children: [
                        //           CircularProgressIndicator(),
                        //           SizedBox(width: 16),
                        //           Text("Adding Data..."),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                        //
                        // final rowData = [
                        //   _selectedDate.toString(),
                        //   _nameController.text,
                        //   _descriptionController.text,
                        //   _amountController.text
                        // ]; // Your data here
                        // //await addEntry(rowData);
                        // Navigator.of(context).pop();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<int> getLastIndex() async {
  //   final ss = await gSheets?.spreadsheet(spreadsheetId);
  //   final sheet = ss?.worksheetByTitle(sheetTitle);
  //
  //   // Find the last row with values in the sheet
  //   final lastRowIndex = await sheet?.values.column(1);
  //   if (lastRowIndex != null && lastRowIndex.isNotEmpty) {
  //     // Extract the index from the last row
  //     final lastIndex = int.tryParse(lastRowIndex.last) ?? 0;
  //     return lastIndex;
  //   } else {
  //     return 0; // Start from 0 if the sheet is empty
  //   }
  // }
  //
  // Future<void> addEntry(List<String> rowData) async {
  //   final ss = await gSheets?.spreadsheet(spreadsheetId);
  //   final sheet = ss?.worksheetByTitle(sheetTitle);
  //
  //   // Check if the title row already exists
  //   final existingTitle = await sheet?.values.row(1);
  //   if (existingTitle == null || existingTitle.isEmpty) {
  //   // If the title row doesn't exist, add it
  //   await sheet?.values
  //       .insertRow(1, ['Serial No', 'Name', 'Date', 'Description', 'Amount']);
  //   }
  //
  //   final lastIndex = await getLastIndex();
  //   final newIndex = lastIndex + 1;
  //   rowData.insert(0, newIndex.toString()); // Insert the index at the beginning
  //
  //   // Find the last row to insert the new entry
  //   final lastRow = await sheet?.values.row(lastIndex + 1);
  //   int insertRowIndex =
  //       (lastRow != null && lastRow.isNotEmpty) ? lastIndex + 1 : lastIndex;
  //
  //   await sheet?.values.insertRow(insertRowIndex + 1, rowData);
  // }
  //
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
