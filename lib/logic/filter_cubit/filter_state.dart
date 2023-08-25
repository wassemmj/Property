part of 'filter_cubit.dart';

enum FilterStatus {
  initial,
  loading,
  success,
  error,
}

class FilterState extends Equatable {
  const FilterState({required this.status});

  final FilterStatus status;

  factory FilterState.initial() => const FilterState(status: FilterStatus.initial);

  @override
  List<Object> get props => [status];

  FilterState copyWith({
    FilterStatus? status,
  }) {
    return FilterState(
      status: status ?? this.status,
    );
  }
}
