import 'package:arcon_app/component/colors.dart';
import 'package:arcon_app/controller/user_controller.dart';
import 'package:arcon_app/view/authentication/signin.dart';
import 'package:arcon_app/view/homepage/validation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: "arcon",
      title: 'Arcon',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primaryColor,
          primary: AppColor.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const SignIn()
          : const ValidationScreen(),
    );
  }
}
