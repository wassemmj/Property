import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState.initial());

  var fav;

  Future addFav(int id) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      print('start cubit');
      await FavoriteRepo.addFav(id);
      print('end cubit');
      emit(state.copyWith(status: FavoriteStatus.success));
    } catch(error) {
      emit(state.copyWith(status: FavoriteStatus.error));
    }
  }

  Future delFav(int id) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      print('start cubit');
      await FavoriteRepo.delFav(id);
      print('end cubit');
      emit(state.copyWith(status: FavoriteStatus.success));
    } catch(error) {
      emit(state.copyWith(status: FavoriteStatus.error));
    }
  }

  Future getFav() async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      print('start cubit');
      fav = await FavoriteRepo.getFav();
      print('end cubit');
      emit(state.copyWith(status: FavoriteStatus.success,fav: fav));
    } catch(error) {
      emit(state.copyWith(status: FavoriteStatus.error));
    }
  }

}
