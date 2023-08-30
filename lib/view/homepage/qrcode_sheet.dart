import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/popover.dart';
import 'package:arcon_app/component/style.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeSheet extends StatelessWidget {
  const QRCodeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Popover(
      mainAxisSize: MainAxisSize.min,
      child: Column(children: [
        Row(
          children: [
            Text(
              'Validation QR',
              style: style.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColor.black.withOpacity(0.8),
              ),
            ),
            Expanded(child: Container()),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.close,
                  color: AppColor.black,
                ),
              ),
            )
          ],
        ),
        Divider(
          color: AppColor.grey,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(16),
          ),
          child: QrImageView(
            data: '123456',
            version: QrVersions.auto,
            errorCorrectionLevel: QrErrorCorrectLevel.H,
            embeddedImage: const AssetImage(
              'assets/logo.jpg',
            ),
            size: 250.0,
          ),
        ),
        SizedBox(
          height: size.height / 15,
        ),
      ]),
    );
  }
}
