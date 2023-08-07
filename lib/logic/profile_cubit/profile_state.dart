part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  error,
}

class ProfileState extends Equatable {
  const ProfileState({required this.status,required this.pro});

  final ProfileStatus status;
  final Map<String,dynamic> pro;

  factory ProfileState.initial() => const ProfileState(status: ProfileStatus.initial, pro: {});

  @override
  List<Object> get props => [status,pro];

  ProfileState copyWith({
    ProfileStatus? status,
    Map<String,dynamic>? pro,
  }) {
    return ProfileState(
      status: status ?? this.status,
      pro: pro ?? this.pro,
    );
  }
}
