import 'package:arcon_app/component/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Popover extends StatelessWidget {
  final Widget? child;
  MainAxisSize mainAxisSize;
  Popover({
    Key? key,
    required this.mainAxisSize,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: mainAxisSize,
        children: [
          _buildHandle(context),
          if (child != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: child!,
            )
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.13,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: AppColor.darkgrey.withOpacity(0.5),
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
