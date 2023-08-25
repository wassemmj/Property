part of 'chart_cubit.dart';

enum ChartStatus {
  initial,
  loading,
  success,
  error,
}

class ChartState extends Equatable {
  const ChartState({required this.status});

  final ChartStatus status;

  factory ChartState.initial() => const ChartState(status: ChartStatus.initial);

  @override
  List<Object> get props => [status];

  ChartState copyWith({
    ChartStatus? status,
  }) {
    return ChartState(
      status: status ?? this.status,
    );
  }
}