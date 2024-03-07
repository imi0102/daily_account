import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:daily_account/core/resources/data_state/data_state.dart';
import 'package:daily_account/features/domain/use_cases/add_data_use_case.dart';
import 'package:equatable/equatable.dart';

part 'add_data_event.dart';

part 'add_data_state.dart';

class AddDataBloc extends Bloc<AddDataEvent, AddDataState> {
  final AddDataUseCase _addDataUseCase;

  AddDataBloc(this._addDataUseCase)
      : super(
          const AddDataState(status: AddDataStatusEnum.success),
        ) {
    on<GetDataEvent>(_onGetDataEvent);
    on<SubmitDataEvent>(_onSubmitRowDataEvent);
  }

  Future<void> _onGetDataEvent(
      GetDataEvent event, Emitter<AddDataState> emit) async {
    try {
      emit(
        state.copyWith(
          status: AddDataStatusEnum.loading,
        ),
      );
      final sheetData = await _addDataUseCase.getHistoryData();

      if (sheetData is DataSuccess) {
        emit(
          state.copyWith(
              status: AddDataStatusEnum.success, sheetData: sheetData.data),
        );
        print("Data successfully Inserted");
      } else {
        emit(
          state.copyWith(
            status: AddDataStatusEnum.fail,
          ),
        );
        print("Data fail to Insert");
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AddDataStatusEnum.fail,
        ),
      );
      print("Error:: $e");
    }
  }

  Future<void> _onSubmitRowDataEvent(
      SubmitDataEvent event, Emitter<AddDataState> emit) async {
    try {
      emit(
        state.copyWith(
          status: AddDataStatusEnum.loading,
        ),
      );
      final isInsertedRecord =
          await _addDataUseCase.submitData(params: event.rowData);

      if (isInsertedRecord is DataSuccess) {
        print("Data successfully Inserted");
      } else {
        print("Data fail to Insert");
      }
      emit(
        state.copyWith(
          status: AddDataStatusEnum.success,
        ),
      );
    } catch (e) {
      print("Error:: $e");
      emit(
        state.copyWith(
          status: AddDataStatusEnum.fail,
        ),
      );
    }
    // try {
    //   emit(
    //     state.copyWith(
    //       status: PassbookStatus.loading,
    //     ),
    //   );
    //   EPFOResponseEntity? model = event.rowData;
    //   if (model != null && model.body != null && model.body!.isNotEmpty) {
    //     for (int i = 0; i < model.body!.length; i++) {
    //       if (model.body![i].key!.contains("answer")) {
    //         final body = Body(key: "answer", value: event.captchaAnswer);
    //         model.body?.removeAt(i);
    //         model.body?.add(body);
    //         break;
    //       }
    //     }
    //   }
    //   event.rowData = model;
    //   final response = await _passbookUseCases.submitCaptchaFromEPFO(
    //       params: event.rowData);
    //   if (response is DataSuccess) {
    //     emit(
    //       state.copyWith(
    //         status: PassbookStatus.success,
    //       ),
    //     );
    //   } else {
    //     emit(
    //       state.copyWith(
    //         status: PassbookStatus.fail,
    //         appException: AppException(response.error),
    //       ),
    //     );
    //
    //     emit(
    //       NextNavigation(),
    //     );
    //     // DialogUtility.errorDialog(
    //     //     errorText:
    //     //         Utils.getString('problem_in_fetching_captcha_image_try_again'),
    //     //     onPressed: () {
    //     //       add(
    //     //         GetCaptchaEvent(state.uanNumber, state.password),
    //     //       );
    //     //     });
    //   }
    // } catch (e) {
    //   emit(
    //     state.copyWith(
    //       appException: AppException(e),
    //       status: PassbookStatus.fail,
    //     ),
    //   );
    // }
  }
}
