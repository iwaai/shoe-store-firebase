import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// packages
import '../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//controllers
import '../../controllers/providers/dotChanger.dart';
//screens
import './components/splashBody.dart';
import '../sign-in/signInScreen.dart';

class splashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  splashScreen({super.key});

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to G L E M, Let’s shop!",
      "image": "assets/images/undraw_Shopping_Bags_rbqu.png"
    },
    {
      "text": "From classic pumps to trendy sneakers .",
      "image": "assets/images/undraw_Like_dislike_re_dwcj.png"
    },
    {
      "text": "Step up your shoe game.",
      "image": "assets/images/undraw_Appreciation_r2a1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
        flex: 3,
        child: SizedBox(
          width: double.infinity,
          child: PageView.builder(
            itemCount: splashData.length,
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              Provider.of<dotChanger>(context, listen: false).setindex(value);
            },
            itemBuilder: (context, index) {
              return splashBody(
                text: splashData[index]["text"] as String,
                image: splashData[index]["image"] as String,
              );
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  splashData.length,
                  (index) => Consumer<dotChanger>(
                        builder: (context, value, child) {
                          return dot(index, value.currentindex);
                        },
                      )),
            ),
            SizedBox(
              height: 70.h,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, signInScreen.routeName);
                },
                child: Container(
                  height: 65.h,
                  width: 285.w,
                  decoration: BoxDecoration(
                    color: kbuttonColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ])));
  }

  AnimatedContainer dot(int index, int currentPage) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kbuttonColor : kPrimaryLightColor,
          borderRadius: BorderRadius.circular(3)),
      duration: kAnimationDuration,
    );
  }
}
