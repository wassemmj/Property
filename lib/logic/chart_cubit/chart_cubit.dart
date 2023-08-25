import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/chart_repo.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  ChartCubit() : super(ChartState.initial());

  var spro ;
  var gpro;
  Future sChart() async {
    emit(state.copyWith(status: ChartStatus.loading));
    try {
      spro = await ChartRepo.sChart();
      emit(state.copyWith(status: ChartStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ChartStatus.error));
    }
  }

  Future gChart() async {
    emit(state.copyWith(status: ChartStatus.loading));
    try {
      gpro = await ChartRepo.gChart();
      // print(gpro);
      emit(state.copyWith(status: ChartStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ChartStatus.error));
    }
  }
}
