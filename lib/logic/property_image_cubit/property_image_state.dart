part of 'property_image_cubit.dart';

enum PropertyImageStatus {
  initial,
  loading,
  success,
  error,
}

class PropertyImageState extends Equatable {
  const PropertyImageState({required this.status,});

  final PropertyImageStatus status;

  factory PropertyImageState.initial() =>
      const PropertyImageState(status: PropertyImageStatus.initial);

  @override
  List<Object> get props => [status];

  PropertyImageState copyWith({PropertyImageStatus? status}) {
    return PropertyImageState(
      status: status ?? this.status,
    );
  }
}
