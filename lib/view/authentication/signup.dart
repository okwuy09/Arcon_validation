import 'package:arcon_app/component/button.dart';
import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/component/formfield.dart';
import 'package:arcon_app/component/style.dart';
import 'package:arcon_app/view/authentication/signin.dart';
import 'package:arcon_app/view/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignUp> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width < 800 ? size.width / 15 : size.width / 3,
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
                    'Hi There 👋',
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
                    'Enter your creadentials to create account',
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
                  height: size.height / 30,
                ),
                TextFormWidget(
                  controller: _password,
                  obscureText: obscure,
                  keyboardType: TextInputType.text,
                  hintText: 'Password',
                  suffixIcon: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => setState(() {
                      obscure = !obscure;
                    }),
                    child: Icon(
                      obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                      color: AppColor.lightBlack.withOpacity(0.8),
                    ),
                  ),
                  validator: (input) =>
                      (input!.isEmpty) ? "Enter your password" : null,
                ),

                SizedBox(
                  height: size.height / 5,
                ),

                /// Signin Button
                MainButton(
                  backgroundColor: AppColor.primaryColor,
                  borderColor: Colors.transparent,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// Dont have Account
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Have an account already?',
                      style: TextStyle(
                        color: AppColor.textGrey,
                        fontSize: 14.0,
                        wordSpacing: -1.5,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const SignIn(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In Here',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          wordSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
