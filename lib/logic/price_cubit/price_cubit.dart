import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/repo/price_repo.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit() : super(PriceState.initial());

  var pro;

  Future detail(int space, String coun,String city, String n,bool s,bool sup,bool lux,bool ind,bool heat) async {
    emit(state.copyWith(status: PriceStatus.loading));
    try {
      pro = await PriceRepo.detail(space, coun, city, n, s, sup, lux, ind, heat);
      print(pro);
      emit(state.copyWith(status: PriceStatus.success));
    } catch(error) {
      emit(state.copyWith(status: PriceStatus.error));
    }
  }
}
