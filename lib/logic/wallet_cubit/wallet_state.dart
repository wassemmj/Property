part of 'wallet_cubit.dart';

enum WalletStatus {
  initial,
  loading,
  success,
  error,
}

class WalletState extends Equatable {
  const WalletState({required this.status});

  final WalletStatus status;

  factory WalletState.initial() =>
      const WalletState(status: WalletStatus.initial);

  @override
  List<Object> get props => [status];

  WalletState copyWith({
    WalletStatus? status,
  }) {
    return WalletState(
      status: status ?? this.status,
    );
  }
}