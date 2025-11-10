import 'package:carousel_slider/carousel_slider.dart';
import 'package:plant_scope/features/onboarding/presentation/widgets/onboarding_widgets.dart';
import 'package:plant_scope/features/onboarding/presentation/widgets/agreements_widget.dart';
import 'package:plant_scope/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:plant_scope/shared/buttons/app_rounded_button.dart';
import 'package:plant_scope/shared/indicators/app_progress_indicator.dart';
import '../../../../app_export.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Hero(
            tag: AppConstants.onboardingHeroTag,
            child: Scaffold(
              body: Stack(
                alignment: Alignment.center,
                children: [
                  /// Background Image Carousel
                  SizedBox(
                    width: context.width,
                    height: context.height * 0.8,
                    child: CarouselSlider.builder(
                      carouselController: cubit.carouselController,
                      itemCount: 3,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        height: double.infinity,
                        onPageChanged: (index, reason) =>
                            context.read<OnboardingCubit>().goToPage(index),
                      ),
                      itemBuilder: (context, index, realIndex) =>
                          index.getOnboardingImage.image(fit: BoxFit.fitWidth),
                    ),
                  ),

                  /// Content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Texts
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                style: context.textTheme.headlineSmall,
                                children:
                                    state.currentIndex.getOnboardingTitleSpans,
                              ),
                            ),
                          ),
                          if (state.currentIndex == 0) ...[
                            Text(
                              LocaleKeys.onboarding_ob1_subtitle.tr(),
                              style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onSurface.withAlpha(140),
                              ),
                            ).topPadding(8),
                          ],
                        ],
                      ).topPadding(80).horizontalPadding(20),

                      /// Bottom Content
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Button
                          AppRoundedButton(
                            buttonText:
                                state.currentIndex.getOnboardingButtonText,
                            onTap: () {
                              if (cubit.isLastPage) {
                                context.go(AppRouter.paywall);
                              } else {
                                cubit.nextPage();
                              }
                            },
                          ),

                          /// Agreements or Progress Indicator
                          Container(
                            height: 60,
                            color: context.scaffoldBackgroundColor,
                            child: (state.currentIndex == 0)
                                ? AgreementsWidget()
                                      .horizontalPadding(60)
                                      .topPadding(16)
                                : Align(
                                    alignment: Alignment.topCenter,
                                    child: AppProgressIndicator(
                                      currentIndex: state.currentIndex,
                                    ),
                                  ),
                          ),
                        ],
                      ).bottomPadding(30),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
