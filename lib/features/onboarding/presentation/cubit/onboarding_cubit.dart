import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  OnboardingCubit() : super(const OnboardingState(currentIndex: 0));

  void nextPage() {
    if (state.currentIndex < 2) {
      final newIndex = state.currentIndex + 1;
      emit(OnboardingState(currentIndex: newIndex));
      carouselController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (state.currentIndex > 0) {
      final newIndex = state.currentIndex - 1;
      emit(OnboardingState(currentIndex: newIndex));
      carouselController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPage(int index) {
    if (index >= 0 && index <= 2) {
      emit(OnboardingState(currentIndex: index));
    }
  }

  bool get isLastPage => state.currentIndex == 2;
  bool get isFirstPage => state.currentIndex == 0;
}
