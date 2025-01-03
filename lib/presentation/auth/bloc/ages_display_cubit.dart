
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zapcart/domain/auth/usecases/get_ages.dart';
import 'package:zapcart/presentation/auth/bloc/ages_display_states.dart';

import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {

  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold(
      (message) {
        emit(
          AgesLoadFailure(message: message)
        );
      },
      (data) {
        emit(
          AgesLoaded(ages: data)
        );
      }
    );

  }
}