import 'package:flutter/material.dart';
// packages
import '../../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashBody extends StatelessWidget {
  const splashBody({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'G L E M',
        style: textTheme.headlineMedium!.copyWith(
            fontSize: 63.sp, fontWeight: FontWeight.bold, color: kbuttonColor),
      ),
      Text(text, style: textTheme.headlineMedium!.copyWith(fontSize: 17.sp)),
      Image.asset(
        image,
        height: 350.h,
        width: 300.w,
      ),
    ]);
  }
}
