part of 'price_cubit.dart';

enum PriceStatus {
  initial,
  loading,
  success,
  error,
}

class PriceState extends Equatable {
  const PriceState({required this.status});

  final PriceStatus status;

  factory PriceState.initial() => const PriceState(status: PriceStatus.initial);

  @override
  List<Object> get props => [status];

  PriceState copyWith({
    PriceStatus? status,
  }) {
    return PriceState(
      status: status ?? this.status,
    );
  }
}