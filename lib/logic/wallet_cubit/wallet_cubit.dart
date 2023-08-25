import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  var k;

  Future get() async {
    emit(state.copyWith(status: WalletStatus.loading));
    try {
      k = await WalletRepo.get();
      emit(state.copyWith(status: WalletStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.error));
    }
  }

  Future add(String balance,String type,String password) async {
    emit(state.copyWith(status: WalletStatus.loading));
    try {
      k = await WalletRepo.add(balance, type, password);
      emit(state.copyWith(status: WalletStatus.success));
    } catch (e) {
      emit(state.copyWith(status: WalletStatus.error));
    }
  }
}
