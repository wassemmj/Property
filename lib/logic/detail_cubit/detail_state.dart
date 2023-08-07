part of 'detail_cubit.dart';

enum DetailStatus {
  initial,
  loading,
  success,
  error,
}

class DetailState extends Equatable {
  const DetailState({required this.status});

  final DetailStatus status;

  factory DetailState.initial() => const DetailState(status: DetailStatus.initial);

  @override
  List<Object> get props => [status];

  DetailState copyWith({
    DetailStatus? status,
  }) {
    return DetailState(
      status: status ?? this.status,
    );
  }
}