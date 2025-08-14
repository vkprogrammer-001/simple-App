part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Map<String, dynamic>> images;
  final bool isLoading;
  final String error;

  const HomeState({
    this.images = const [],
    this.isLoading = false,
    this.error = '',
  });

  HomeState copyWith({
    List<Map<String, dynamic>>? images,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [images, isLoading, error];
}
