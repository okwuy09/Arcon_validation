import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/view/onboarding/onbording_model.dart';
import 'package:arcon_app/view/onboarding/page_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();

  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> items = [
      /// first slide
      const OnBoardingModel(
        index: 0,
        percent: 50,
        slideImage: 'assets/arcon1.jpg',
        title:
            'We strive to set and promote ethical and scientific standards in the study of cancer awareness around our environment',
      ),

      /// second slide
      const OnBoardingModel(
        index: 1,
        percent: 100,
        slideImage: 'assets/arcon2.jpg',
        title:
            'Birth ideas on developing a robust and competent cancer-free health care system in Nigeria and international bodies',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) => setState(() {
            pageIndex = index;
          }),
          children: [
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
            OnBoardingPage(
              index: pageIndex,
              percent: items[pageIndex].percent,
              slideImage: items[pageIndex].slideImage,
              title: items[pageIndex].title,
              onTap: () => _controller.animateToPage(
                pageIndex + 1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
              onTapSkip: () => _controller.animateToPage(
                1,
                duration: const Duration(microseconds: 500),
                curve: Curves.linear,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
