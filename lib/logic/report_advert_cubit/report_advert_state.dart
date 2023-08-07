part of 'report_advert_cubit.dart';

enum ReportAdvertStatus {
  initial,
  loading,
  success,
  error,
}

class ReportAdvertState extends Equatable {
  const ReportAdvertState({required this.status});

  final ReportAdvertStatus status;

  factory ReportAdvertState.initial() => const ReportAdvertState(status: ReportAdvertStatus.initial);

  @override
  List<Object> get props => [status];

  ReportAdvertState copyWith({
    ReportAdvertStatus? status,
  }) {
    return ReportAdvertState(
      status: status ?? this.status,
    );
  }
}