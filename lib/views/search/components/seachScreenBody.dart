// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// controllers
// screens

class seacrhScreenBody extends StatelessWidget {
  const seacrhScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SizedBox(
            child: Stack(children: [
          Positioned(
              top: 0,
              bottom: 310.sp,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height.h * 0.3.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/top_image.png'),
                        fit: BoxFit.cover)),
              ))
        ])));
  }
}
