import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  var proo;

  Future pro(int id) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      proo = await ProfileRepo.pro(id);
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
