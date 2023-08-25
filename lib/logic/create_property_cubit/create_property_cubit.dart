import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:property_app/data/Model/property_model.dart';

import '../../data/repo/create_property_repo.dart';

part 'create_property_state.dart';

class CreatePropertyCubit extends Cubit<CreatePropertyState> {
  CreatePropertyCubit() : super(CreatePropertyState.initial());

  var proo;

  Future create(PropertyModel propertyModel) async {
    emit(state.copyWith(status: CreatePropertyStatus.loading));
    try {
      proo = await CreatePropertyRepo.create(propertyModel);
      emit(state.copyWith(status: CreatePropertyStatus.success));
    } catch(error) {
      emit(state.copyWith(status: CreatePropertyStatus.error));
    }
  }
}
