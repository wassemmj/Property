part of 'subscribe_cubit.dart';

enum SubscribeStatus {
  initial,
  loading,
  success,
  error,
}

class SubscribeState extends Equatable {
  const SubscribeState({required this.status});

  final SubscribeStatus status;

  factory SubscribeState.initial() =>
      const SubscribeState(status: SubscribeStatus.initial);

  @override
  List<Object> get props => [status];

  SubscribeState copyWith({
    SubscribeStatus? status,
  }) {
    return SubscribeState(
      status: status ?? this.status,
    );
  }
}