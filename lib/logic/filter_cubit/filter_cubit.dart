import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/filter_repo.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  var proo;

  Future pro(String? country,String? city,String? ne,String? operation,String? name,String? type,String? space,String? mP,String? maP) async {
    emit(state.copyWith(status: FilterStatus.loading));
    try {
      print('start proooo');
      proo = await FilterRepo.pro(country, city, ne, operation, name, type, space, mP, maP);
      print(proo);
      emit(state.copyWith(status: FilterStatus.success));
    } catch(error) {
      emit(state.copyWith(status: FilterStatus.error));
    }
  }

}
