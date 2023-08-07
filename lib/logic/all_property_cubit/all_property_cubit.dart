import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/repo/all_property_repo.dart';

part 'all_property_state.dart';

class AllPropertyCubit extends Cubit<AllPropertyState> {
  AllPropertyCubit() : super(AllPropertyState.initial());

  List? property;
  List? category;
  List? types;

  Future allProperty() async {
    emit(state.copyWith(status: AllPropertyStatus.loading));
    try {
      property = await AllPropertyRepo.allProperty();
      emit(state.copyWith(status: AllPropertyStatus.success));
    } catch(error) {
      emit(state.copyWith(status: AllPropertyStatus.error));
    }
  }

  Future catt() async {
    emit(state.copyWith(status: AllPropertyStatus.loading));
    try {
      category = await AllPropertyRepo.cat();
      print(category);
      emit(state.copyWith(status: AllPropertyStatus.success));
    } catch(error) {
      emit(state.copyWith(status: AllPropertyStatus.error));
    }
  }

  Future cat() async {
    emit(state.copyWith(status: AllPropertyStatus.loading));
    try {
      category = await AllPropertyRepo.cat();
      types = await AllPropertyRepo.type(category![0]['name']);
      property = await AllPropertyRepo.allProperty();
      emit(state.copyWith(status: AllPropertyStatus.success));
    } catch(error) {
      emit(state.copyWith(status: AllPropertyStatus.error));
    }
  }

  Future type(String name) async {
    emit(state.copyWith(status: AllPropertyStatus.loading));
    try {
      types = await AllPropertyRepo.type(name);
      print(category);
      emit(state.copyWith(status: AllPropertyStatus.success));
    } catch(error) {
      emit(state.copyWith(status: AllPropertyStatus.error));
    }
  }
}
