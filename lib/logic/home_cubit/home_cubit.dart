import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  var top;
  var random;


  Future get() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      print('start cubit');
      top = (await HomeRepo.getTop()).values.toList();
      random = (await HomeRepo.getRandom());
      print('end cubit');
      emit(state.copyWith(status: HomeStatus.success));
    } catch(error) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  var searchList;

  Future search(String query) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      print('start cubit');
      searchList = await HomeRepo.search(query);
      print('end cubit');
      emit(state.copyWith(status: HomeStatus.success));
    } catch(error) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future getTop() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      print('start cubit');
      top = (await HomeRepo.getTop()).values.toList();
      print('end cubit');
      emit(state.copyWith(status: HomeStatus.success));
    } catch(error) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future getRandom() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      print('start cubit');
      random = (await HomeRepo.getRandom());
      print('end cubit');
      emit(state.copyWith(status: HomeStatus.success));
    } catch(error) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
