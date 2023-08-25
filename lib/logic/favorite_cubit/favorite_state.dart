part of 'favorite_cubit.dart';

enum FavoriteStatus {
  initial,
  loading,
  success,
  error,
}

class FavoriteState extends Equatable {
  const FavoriteState({required this.status, required this.fav});

  final FavoriteStatus status;
  final List fav;

  factory FavoriteState.initial() =>
      const FavoriteState(status: FavoriteStatus.initial, fav: []);

  @override
  List<Object> get props => [status,fav];

  FavoriteState copyWith({FavoriteStatus? status, List? fav}) {
    return FavoriteState(
      status: status ?? this.status,
      fav: fav ?? this.fav,
    );
  }
}
