import 'package:arcon_app/component/colors.dart';
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

checkOutNotComplete(context, String message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
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
        duration: const Duration(milliseconds: 5000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: AppColor.red)),
      ),
    );
successOperation(context) => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 160,
          left: MediaQuery.of(context).size.width / 4,
          right: MediaQuery.of(context).size.width / 4,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 25,
              color: AppColor.white,
            ),
            const SizedBox(width: 40),
            Flexible(
              child: Text(
                'Success',
                style: style.copyWith(
                  color: AppColor.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(color: AppColor.white)),
      ),
    );

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
