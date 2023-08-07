part of 'create_property_cubit.dart';

enum CreatePropertyStatus {
  initial,
  loading,
  success,
  error,
}

class CreatePropertyState extends Equatable {
  const CreatePropertyState({required this.status, required this.propertyModel});

  final CreatePropertyStatus status;
  final PropertyModel propertyModel;

  factory CreatePropertyState.initial() => CreatePropertyState(status: CreatePropertyStatus.initial,propertyModel: PropertyModel.initial());

  @override
  List<Object> get props => [];

  CreatePropertyState copyWith({
    CreatePropertyStatus? status,
    PropertyModel? propertyModel,
  }) {
    return CreatePropertyState(
      status: status ?? this.status,
      propertyModel: propertyModel ?? this.propertyModel,
    );
  }
}
