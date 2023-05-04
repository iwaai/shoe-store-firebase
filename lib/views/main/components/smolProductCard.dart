import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class smolProductCard extends StatelessWidget {
  const smolProductCard({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(1, 1))
          ],
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16.sp)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.28.w,
    );
  }
}
