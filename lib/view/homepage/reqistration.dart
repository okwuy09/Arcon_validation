import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/formfield.dart';
import 'package:arcon_app/component/style.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

final TextEditingController _email = TextEditingController();
final TextEditingController _name = TextEditingController();

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'Registration',
          style: style.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.black.withOpacity(0.8),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width < 800 ? size.width / 20 : size.width / 5,
            vertical: 25,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// Email adress field
            RichText(
              text: TextSpan(
                text: 'Email Address',
                style: style.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack.withOpacity(0.8),
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: style.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormWidget(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: (input) => !(input?.contains('@') ?? false)
                  ? "Enter your email address"
                  : null,
            ),
            SizedBox(height: size.height / 35),

            /// Name field
            RichText(
              text: TextSpan(
                text: 'Name',
                style: style.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack.withOpacity(0.8),
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: style.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            TextFormWidget(
              controller: _name,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.name],
              validator: (input) => !(input?.contains('@') ?? false)
                  ? "Enter your email address"
                  : null,
            ),

            SizedBox(height: size.height / 35),

            /// Gender
            RichText(
              text: TextSpan(
                text: 'Gender',
                style: style.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightBlack.withOpacity(0.8),
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: style.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColor.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ]),
        ),
      ),
    );
  }
}
