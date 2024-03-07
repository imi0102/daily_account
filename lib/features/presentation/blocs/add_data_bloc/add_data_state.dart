part of 'add_data_bloc.dart';

enum AddDataStatusEnum { loading, success, fail }

final class AddDataState extends Equatable {
  final AddDataStatusEnum? status;
  final List<List<dynamic>>? sheetData;

  const AddDataState({required this.status, this.sheetData});

  AddDataState copyWith({
    AddDataStatusEnum? status,
    List<List<dynamic>>? sheetData,
  }) =>
      AddDataState(
        status: status ?? this.status,
        sheetData: sheetData ?? this.sheetData,
      );

  @override
  List<Object?> get props => [
        status,
        sheetData,
      ];
}
