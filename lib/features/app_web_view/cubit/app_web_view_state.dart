part of 'app_web_view_cubit.dart';

class AppWebViewState extends Equatable {
  final String? url;
  final String? pageTitle;
  final bool isLoading;
  final double progress;

  const AppWebViewState({
    required this.url,
    required this.pageTitle,
    required this.isLoading,
    required this.progress,
  });

  AppWebViewState copyWith({
    String? url,
    String? pageTitle,
    bool? isLoading,
    double? progress,
  }) {
    return AppWebViewState(
      url: url ?? this.url,
      pageTitle: pageTitle ?? this.pageTitle,
      isLoading: isLoading ?? this.isLoading,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [url, pageTitle, isLoading, progress];
}
