import 'package:arcon_app/component/button.dart';
import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/popover.dart';
import 'package:arcon_app/component/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPopUpSheet extends StatelessWidget {
  final BuildContext ctx;
  const SignUpPopUpSheet({Key? key, required this.ctx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(
        children: [
          Text(
            'Choose an option to\ncontinue',
            style: style.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Sora',
              letterSpacing: 0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          MainButton(
            borderColor: AppColor.primaryColor,
            backgroundColor: AppColor.white,
            onTap: () async => {
              Navigator.pop(context),
              //await signIn(ctx),
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          MainButton(
            borderColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            onTap: () => Navigator.pushReplacement(
              ctx,
              CupertinoPageRoute(
                builder: (_) => Container(),
              ),
            ),
            child: Text(
              'Create Account',
              style: TextStyle(
                fontSize: 14,
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
