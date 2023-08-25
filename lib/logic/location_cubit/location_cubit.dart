import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState.initial());

  var  proo;
  List li = [];

  Future pro() async {
    emit(state.copyWith(status: LocationStatus.loading));
    try {
      print('start proooo');
      proo = await LocationRepo.pro();
      // print(li);
      emit(state.copyWith(status: LocationStatus.success));
    } catch(error) {
      emit(state.copyWith(status: LocationStatus.error));
    }
  }

}
