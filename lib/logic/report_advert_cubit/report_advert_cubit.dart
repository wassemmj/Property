import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/report_advert_repo.dart';

part 'report_advert_state.dart';

class ReportAdvertCubit extends Cubit<ReportAdvertState> {
  ReportAdvertCubit() : super(ReportAdvertState.initial());

  Future pro(int id,String m) async {
    emit(state.copyWith(status: ReportAdvertStatus.loading));
    try {
      await ReportAdvertRepo.report(id,m);
      emit(state.copyWith(status: ReportAdvertStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ReportAdvertStatus.error));
    }
  }

  Future proU(int id,String m) async {
    emit(state.copyWith(status: ReportAdvertStatus.loading));
    try {
      await ReportAdvertRepo.reportU(id,m);
      emit(state.copyWith(status: ReportAdvertStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ReportAdvertStatus.error));
    }
  }
}
