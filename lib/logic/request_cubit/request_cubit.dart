import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/request_repo.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestState.initial());

  Future sendRequest(int id,String m) async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      print(state.status);
      await RequestRepo.sendRequest(id,m);
      emit(state.copyWith(status: RequestStatus.success));
      print(state.status);
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }
}
