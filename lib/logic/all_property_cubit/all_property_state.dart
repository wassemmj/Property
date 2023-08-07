part of 'all_property_cubit.dart';

enum AllPropertyStatus {
  initial,
  loading,
  success,
  error,
}

class AllPropertyState extends Equatable {
  final AllPropertyStatus status;

  const AllPropertyState({required this.status});

  factory AllPropertyState.initial() => const AllPropertyState(status: AllPropertyStatus.initial);

  @override
  List<Object?> get props => [status];

  AllPropertyState copyWith({
    AllPropertyStatus? status,
  }) {
    return AllPropertyState(
      status: status ?? this.status,
    );
  }
}
