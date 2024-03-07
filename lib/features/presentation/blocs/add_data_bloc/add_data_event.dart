part of 'add_data_bloc.dart';

abstract class AddDataEvent extends Equatable {
  const AddDataEvent();
}

class GetDataEvent extends AddDataEvent {
  const GetDataEvent();

  @override
  List<Object?> get props => [];
}

class SubmitDataEvent extends AddDataEvent {
  final List<String> rowData;

  const SubmitDataEvent(
    this.rowData,
  );

  @override
  List<Object?> get props => [
        rowData,
      ];
}
