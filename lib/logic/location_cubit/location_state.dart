part of 'location_cubit.dart';

enum LocationStatus {
  initial,
  loading,
  success,
  error,
}

class LocationState extends Equatable {
  const LocationState({required this.status});

  final LocationStatus status;

  factory LocationState.initial() => const LocationState(status: LocationStatus.initial);

  @override
  List<Object> get props => [status];

  LocationState copyWith({
    LocationStatus? status,
  }) {
    return LocationState(
      status: status ?? this.status,
    );
  }
}
