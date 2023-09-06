import 'package:arcon_app/component/button.dart';
import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/formfield.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final TextEditingController _email = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordState extends State<ForgotPassword> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var provider = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.lightBlack, width: 1.5),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: style.copyWith(color: AppColor.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width < 800 ? 20 : size.width / 3,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.jpg',
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password 👋',
                    style: style.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Enter Email associated with your Account, a mail will be sent to you, with link to update your password.',
                    style: style.copyWith(
                      color: AppColor.darkerGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                TextFormWidget(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  autofillHints: const [AutofillHints.email],
                  validator: (input) => !(input?.contains('@') ?? false)
                      ? "Enter your email address"
                      : null,
                ),

                SizedBox(
                  height: size.height / 7,
                ),

                /// Signin Button
                MainButton(
                  backgroundColor: AppColor.primaryColor,
                  borderColor: Colors.transparent,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await provider.resetPassword(
                        email: _email.text,
                        context: context,
                      );
                    }
                  },
                  child: provider.isResetPassword
                      ? buttonCircularIndicator
                      : Text(
                          'SEND MAIL',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
