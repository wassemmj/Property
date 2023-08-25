import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/request_repo.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestState.initial());

  var uRequest;
  var pRequest;

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

  Future getUserRequest() async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      uRequest = await RequestRepo.getUserRequest();
      print(uRequest);
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  Future getPubRequest() async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      var ll = await RequestRepo.getPubRequest();
      if(ll == 'you have no requests') {
        pRequest = [];
      } else {
        pRequest = ll;
      }
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  Future accept(int rId,int aId) async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      await RequestRepo.accept(rId, aId);
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  Future reject(int rId,int aId,String d) async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      await RequestRepo.reject(rId, aId, d);
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  Future deleteRequest(int id) async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      await RequestRepo.deleteRequest(id);
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }

  Future delete(int id) async {
    emit(state.copyWith(status: RequestStatus.loading));
    print(state.status);
    try {
      await RequestRepo.delete(id);
      emit(state.copyWith(status: RequestStatus.success));
    } catch(error) {
      emit(state.copyWith(status: RequestStatus.error));
    }
  }
}
