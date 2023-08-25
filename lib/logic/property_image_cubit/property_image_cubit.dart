import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/property_image_repo.dart';

part 'property_image_state.dart';

class PropertyImageCubit extends Cubit<PropertyImageState> {
  PropertyImageCubit() : super(PropertyImageState.initial());

  var image;

  Future addFav(int id,String desc,File f,bool cover) async {
    emit(state.copyWith(status: PropertyImageStatus.loading));
    try {
      print('start cubit');
      await PropertyImageRepo.createImage(id, desc, f, cover);
      emit(state.copyWith(status: PropertyImageStatus.success));
      print('end cubit');
    } catch(error) {
      emit(state.copyWith(status: PropertyImageStatus.error));
    }
  }

  Future getImage(int id) async {
    emit(state.copyWith(status: PropertyImageStatus.loading));
    try {
      print('start cubit');
      image = await PropertyImageRepo.getImage(id);
      print('end cubit');
      emit(state.copyWith(status: PropertyImageStatus.success));
    } catch(error) {
      emit(state.copyWith(status: PropertyImageStatus.error));
    }
  }
}
