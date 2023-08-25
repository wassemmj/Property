import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Core/api.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());

  var proo;
  var favAccount;
  var folAccount;
  var c;
  var ess;

  var image;


  Future pro1(int id) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      proo = await ProfileRepo.pro(id);
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future pro(int id) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      proo = await ProfileRepo.pro(id);
      await getImage();
      await getUserEss();
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future follow(int id) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await ProfileRepo.follow(id);
      emit(state.copyWith(status: ProfileStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future unfollow(int id) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await ProfileRepo.unfollow(id);
      emit(state.copyWith(status: ProfileStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future getImage() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      image = await ProfileRepo.getImage();
      emit(state.copyWith(status: ProfileStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future put(String name,String password,String co,String num,String f,String t,String d) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await ProfileRepo.put(name, password, co, num, f, t, d);
      emit(state.copyWith(status: ProfileStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future createImage(File f,bool update) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await ProfileRepo.createImage(f,update);
      emit(state.copyWith(status: ProfileStatus.success));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future getFavAccount() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      favAccount = await ProfileRepo.getFavAccount();
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future getFolAccount() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      favAccount = await ProfileRepo.getFolAccount();
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future getUserEss() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      ess = await ProfileRepo.getUserEss();
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }

  Future delete() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      ess = await ProfileRepo.delete();
      emit(state.copyWith(status: ProfileStatus.success,pro: proo));
    } catch(error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
