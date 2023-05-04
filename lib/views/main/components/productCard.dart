// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../models/constant.dart';
// controllers
// screens

class productCard extends StatelessWidget {
  const productCard(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.name,
      required this.image});
  final String price;
  final String category;
  final String id;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 0, 20.h, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(
          16.sp,
        )),
        child: Container(
          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width * 0.6.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22.sp)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 1,
                    blurRadius: 0.8,
                    offset: Offset(1, 1))
              ],
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(image))),
                ),
                Positioned(
                    right: 12,
                    top: 12,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(Iconsax.heart),
                    ))
              ]),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 28.sp,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.bold)),
                    Text(category,
                        style: textTheme.bodyMedium!.copyWith(
                          fontSize: 12.sp,
                          letterSpacing: 1.1,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$$price',
                          style: textTheme.bodyMedium!.copyWith(
                              fontSize: 17.sp,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('Colors',
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: 17.sp,
                                letterSpacing: 1.1,
                              )),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 26.h,
                            width: 26.h,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
