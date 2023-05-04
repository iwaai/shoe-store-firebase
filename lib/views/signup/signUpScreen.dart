// packages
import 'package:flutter/material.dart';
import '../../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// controllers
// screens
import './components/signUpBody.dart';

class signUpScreen extends StatelessWidget {
  static const routeName = '/sign-up-screen';
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75.0),
          child: Text(
            "Sign Up",
            style: textTheme.headlineMedium!
                .copyWith(color: kbuttonColor, fontSize: 30.sp),
          ),
        ),
      ),
      body: const signUpBody(),
    );
  }
}
