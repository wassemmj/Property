part of 'request_cubit.dart';

enum RequestStatus {
  initial,
  loading,
  success,
  error,
}

class RequestState extends Equatable {
  const RequestState({required this.status});

  final RequestStatus status;

  factory RequestState.initial() => const RequestState(status: RequestStatus.initial);

  @override
  List<Object> get props => [status];

  RequestState copyWith({
    RequestStatus? status,
  }) {
    return RequestState(
      status: status ?? this.status,
    );
  }
}