import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/repo/subscribe_repo.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends Cubit<SubscribeState> {
  SubscribeCubit() : super(SubscribeState.initial());

  var pro;

  Future subscribe(int id,String password) async {
    emit(state.copyWith(status: SubscribeStatus.loading));
    try {
      await SubscribeRepo.subscrribe(id, password);
      emit(state.copyWith(status: SubscribeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SubscribeStatus.error));
    }
  }

  Future get() async {
    emit(state.copyWith(status: SubscribeStatus.loading));
    try {
      pro = await SubscribeRepo.get();
      emit(state.copyWith(status: SubscribeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SubscribeStatus.error));
    }
  }
}
