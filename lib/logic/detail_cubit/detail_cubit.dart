import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/detail_repo.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState.initial());

  var pro;

  Future detail(int id) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      pro = await DetailRepo.detail(id);
      emit(state.copyWith(status: DetailStatus.success));
    } catch(error) {
      emit(state.copyWith(status: DetailStatus.error));
    }
  }
}
