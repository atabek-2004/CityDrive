import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';

@RoutePage()
class AuthSecondPage extends StatefulWidget {
  const AuthSecondPage({super.key});

  @override
  State<AuthSecondPage> createState() => _AuthSecondPageState();
}

class _AuthSecondPageState extends State<AuthSecondPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      image: Assets.images.png.onboardOne.path, 
      title: 'Проверяй отметки жителей',
    ),
    OnboardingItem(
      image: Assets.images.png.onboardTwo.path, 
      title: 'Выезжай и подтверждай',
    ),
    OnboardingItem(
      image: Assets.images.png.onBoardThree.path, 
      title: 'Вместе делаем дороги Казахстана безопаснее.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingItems.length,
                itemBuilder: (context, index) {
                  return _buildOnboardingPage(_onboardingItems[index]);
                },
              ),
            ),
            _buildPageIndicator(),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      if (_currentPage < _onboardingItems.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        context.router.push(const SignUpSecondRoute());
                      }
                    },
                    style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                      backgroundColor: const WidgetStatePropertyAll(
                        AppColors.muteButton63B,
                      ),
                    ),
                    text: 'Создать аккаунт',
                    child: null,
                  ),
                  const Gap(12),
                  CustomButton(
                    onPressed: () {
                      // Действие для входа
                      // context.router.push(const OnboardingSeondRoute());

                      context.router.push(const LoginRoute());
                    },
                    style: CustomButtonStyles.mainButtonStyle(context).copyWith(
                      backgroundColor: const WidgetStatePropertyAll(
                        Color(0xFFE0E0E0),
                      ),
                      
                      // side: const WidgetStatePropertyAll(
                      //   BorderSide(color: AppColors.muteButton63B, width: 1),
                      // ),
                    ),
                    
                    child: Text(
                      'Войти',
                      style: AppTextStyles.title18W700.copyWith(color: AppColors.mainColor),
                    ),
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            item.image,
            height: 250,
            fit: BoxFit.contain,
          ),
          const Gap(48),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              item.title,
              style: AppTextStyles.title20BoldW600.copyWith(
                color: AppColors.text595959,
                fontSize: 16,
              ),
              // textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingItems.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? AppColors.mainColor
                : Color(0xFFA0A0A0),
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;

  OnboardingItem({
    required this.image,
    required this.title,
  });
}