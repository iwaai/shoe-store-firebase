// ignore_for_file: camel_case_types
// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_firebase/models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoe_firebase/views/add/addScreen.dart';

// controllers
//providers
import '../../controllers/providers/pageswitch.dart';
// screens
import '../main/mainScreen.dart';
import '../cart/cartScreen.dart';
import '../profile/profileScreen.dart';
import '../search/searchScreen.dart';

class homeScreen extends StatelessWidget {
  homeScreen({super.key});
  List<Widget> pagelist = const [
    mainScreen(),
    searchScreen(),
    addScreen(),
    cartScreen(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final switchpage = Provider.of<pageswitch>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Consumer<pageswitch>(builder: (context, value, child) {
        return pagelist[value.pageIndex];
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12.sp)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomNavItem(Iconsax.home, 0, context),
                  bottomNavItem(Iconsax.search_normal, 1, context),
                  bottomNavItem(Iconsax.add, 2, context),
                  bottomNavItem(Iconsax.shopping_bag, 3, context),
                  bottomNavItem(Iconsax.profile_2user, 4, context)
                ]),
          ),
        ),
      ),
    );
  }

  GestureDetector bottomNavItem(
      IconData icon, int index, BuildContext context) {
    //final pageSwitch = Provider.of<pageswitch>(context,listen: false);
    return GestureDetector(
      onTap: () {
        Provider.of<pageswitch>(context, listen: false).swithPage(index);
      },
      child: SizedBox(
        height: 50.h,
        width: 36.w,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
