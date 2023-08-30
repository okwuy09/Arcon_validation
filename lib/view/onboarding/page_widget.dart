import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/view/authentication/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      this.onTap,
      required this.percent,
      this.onTapSkip,
      required this.slideImage,
      required this.index,
      required this.title});
  final void Function()? onTap;
  final void Function()? onTapSkip;
  final int percent;
  final String title;
  final String slideImage;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColor.primaryColor,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: AppColor.white, //lightGrey,
              ),
              width: size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  slideImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: size.height / 2.4,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColor.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: style.copyWith(
                      fontSize: 19,
                      color: AppColor.black.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 100 - percent,
                    circularDirection: CircularDirection.counterclockwise,
                    selectedColor: AppColor.primaryColor.withOpacity(0.06),
                    unselectedColor: AppColor.primaryColor,
                    roundedCap: (_, __) => true,
                    customStepSize: (p0, p1) => 2.5,
                    padding: 0,
                    width: 90,
                    height: 90,
                    child: Center(
                      child: GestureDetector(
                        onTap: index == 1
                            ? () async {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (_) => const SignIn(),
                                  ),
                                );
                              }
                            : onTap,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
