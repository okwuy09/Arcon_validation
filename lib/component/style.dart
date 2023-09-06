import 'package:arcon_app/component/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final style = TextStyle(
  fontSize: 16,
  fontFamily: 'Sequel Sans',
  color: AppColor.black,
  wordSpacing: -0.3,
);

final buttonCircularIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    backgroundColor: AppColor.lightGrey.withOpacity(0.6),
    valueColor: AlwaysStoppedAnimation(AppColor.white),
    strokeWidth: 4.0,
  ),
);

void validatedDialog(BuildContext context, String name) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext ctx) {
      return Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.warning_rounded,
                size: 50,
                color: AppColor.yellow,
              ),
            ),
          ),
          content: RichText(
            text: TextSpan(
              text: 'This user ',
              style: style.copyWith(
                fontSize: 18,
              ),
              children: [
                TextSpan(
                  text: name,
                  style: style.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
                TextSpan(
                  text: 'has been Validated',
                  style: style.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            // The "Yes" button
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
              },
              isDefaultAction: true,
              isDestructiveAction: true,
              child: Text(
                'BACK',
                style: style.copyWith(
                  color: AppColor.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void inValidUserDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext ctx) {
      return Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.warning_rounded,
                size: 50,
                color: AppColor.yellow,
              ),
            ),
          ),
          content: Text(
            'User Record Not Found, Please Register And Try Again Later',
            style: style.copyWith(
              fontSize: 18,
            ),
          ),
          actions: [
            // The "Yes" button
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
              },
              isDefaultAction: true,
              isDestructiveAction: true,
              child: Text(
                'BACK',
                style: style.copyWith(
                  color: AppColor.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

failedOperation({context, required String message}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 145,
          left: 25,
          right: 25,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.report_rounded,
              size: 20,
              color: AppColor.red,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                message,
                style: style.copyWith(
                  color: AppColor.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.lightRed,
        padding: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: AppColor.red)),
      ),
    );
