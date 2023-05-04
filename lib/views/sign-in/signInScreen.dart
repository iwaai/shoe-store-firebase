// packages
import 'package:flutter/material.dart';
import '../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// controllers
// screens
import './components/signInBody.dart';

class signInScreen extends StatelessWidget {
  static const routeName = '/sign-in-screen';
  const signInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75.0),
          child: Text(
            "Sign In",
            style: textTheme.headlineMedium!
                .copyWith(color: kbuttonColor, fontSize: 30.sp),
          ),
        ),
      ),
      body: const signInBody(),
    );
  }
}
