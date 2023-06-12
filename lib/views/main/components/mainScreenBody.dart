// packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../models/constant.dart';
import '../../../models/maleShoe.dart';
// controllers
//providers
import '../../../models/ShoeProvider.dart';
// screens

import './productCard.dart';
import './smolProductCard.dart';

class mainScreenBody extends StatefulWidget {
  const mainScreenBody({super.key});

  @override
  State<mainScreenBody> createState() => _mainScreenBodyState();
}

class _mainScreenBodyState extends State<mainScreenBody>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    //rint('********************  PAGE CREATED    ************8');
    final maleshoeListFirebase =
        Provider.of<ShoeMaleProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox(
          child: Stack(
        children: [
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
              child: Padding(
                padding: EdgeInsets.only(top: 45.sp, left: 10.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Athletic Shoes ',
                        style: textTheme.headlineMedium!.copyWith(
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Collection',
                        style: textTheme.headlineMedium!.copyWith(
                            fontSize: 42.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              textTheme.bodyLarge!.copyWith(fontSize: 22.sp),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: 'Men Shoes',
                            ),
                            Tab(
                              text: 'Women Shoes',
                            ),
                            Tab(
                              text: 'Kids Shoes',
                            )
                          ]),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.265.h),
            child: Container(
              padding: EdgeInsets.only(left: 10.w),
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.341.h,
                        child: FutureBuilder<List<maleShoe>>(
                            future: maleshoeListFirebase.shoemale,
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text(
                                  "Error ${snapshot.error}",
                                  style: const TextStyle(color: Colors.white),
                                );
                              } else {
                                //final male = snapshot.data;
                                final maleV2 = snapshot.data;
                                return Consumer<ShoeMaleProvider>(
                                    builder: (context, value, _) {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: maleV2!.length,
                                      itemBuilder: (context, index) {
                                        final shoe = snapshot.data![index];
                                        return productCard(
                                            price: shoe.price,
                                            category: shoe.category,
                                            id: shoe.id,
                                            name: shoe.name,
                                            image: shoe.imageUrl[1]);
                                      });
                                });
                              }
                            }))),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 1.h, 10.w, 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest collection',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Show All',
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontSize: 22.sp),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right4,
                                    size: 22.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13.h,
                          child: FutureBuilder<List<maleShoe>>(
                              future: maleshoeListFirebase.shoemale,
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "Error ${snapshot.error}",
                                    style: const TextStyle(color: Colors.white),
                                  );
                                } else {
                                  final male = snapshot.data;
                                  return Consumer<ShoeMaleProvider>(
                                      builder: (context, value, _) {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: male!.length,
                                        itemBuilder: (context, index) {
                                          final shoe = snapshot.data![index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: smolProductCard(
                                                url: shoe.imageUrl[1]),
                                          );
                                        });
                                  });
                                }
                              }))),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.341.h,
                        child: FutureBuilder<List<maleShoe>>(
                            future: maleshoeListFirebase.shoemale,
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text(
                                  "Error ${snapshot.error}",
                                  style: const TextStyle(color: Colors.white),
                                );
                              } else {
                                //final male = snapshot.data;
                                final maleV2 = snapshot.data;
                                return Consumer<ShoeMaleProvider>(
                                    builder: (context, value, _) {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: maleV2!.length,
                                      itemBuilder: (context, index) {
                                        final shoe = snapshot.data![index];
                                        return productCard(
                                            price: shoe.price,
                                            category: shoe.category,
                                            id: shoe.id,
                                            name: shoe.name,
                                            image: shoe.imageUrl[1]);
                                      });
                                });
                              }
                            }))),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 1.h, 10.w, 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest collection',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Show All',
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontSize: 22.sp),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right4,
                                    size: 22.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13.h,
                          child: FutureBuilder<List<maleShoe>>(
                              future: maleshoeListFirebase.shoemale,
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "Error ${snapshot.error}",
                                    style: const TextStyle(color: Colors.white),
                                  );
                                } else {
                                  final male = snapshot.data;
                                  return Consumer<ShoeMaleProvider>(
                                      builder: (context, value, _) {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: male!.length,
                                        itemBuilder: (context, index) {
                                          final shoe = snapshot.data![index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: smolProductCard(
                                                url: shoe.imageUrl[1]),
                                          );
                                        });
                                  });
                                }
                              }))),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.341.h,
                        child: FutureBuilder<List<maleShoe>>(
                            future: maleshoeListFirebase.shoemale,
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                );
                              } else if (snapshot.hasError) {
                                return Text(
                                  "Error ${snapshot.error}",
                                  style: const TextStyle(color: Colors.white),
                                );
                              } else {
                                //final male = snapshot.data;
                                final maleV2 = snapshot.data;
                                return Consumer<ShoeMaleProvider>(
                                    builder: (context, value, _) {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: maleV2!.length,
                                      itemBuilder: (context, index) {
                                        final shoe = snapshot.data![index];
                                        return productCard(
                                            price: shoe.price,
                                            category: shoe.category,
                                            id: shoe.id,
                                            name: shoe.name,
                                            image: shoe.imageUrl[1]);
                                      });
                                });
                              }
                            }))),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.w, 1.h, 10.w, 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Latest collection',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Show All',
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontSize: 22.sp),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right4,
                                    size: 22.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13.h,
                          child: FutureBuilder<List<maleShoe>>(
                              future: maleshoeListFirebase.shoemale,
                              builder: ((context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                    "Error ${snapshot.error}",
                                    style: const TextStyle(color: Colors.white),
                                  );
                                } else {
                                  final male = snapshot.data;
                                  return Consumer<ShoeMaleProvider>(
                                      builder: (context, value, _) {
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: male!.length,
                                        itemBuilder: (context, index) {
                                          final shoe = snapshot.data![index];
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            child: smolProductCard(
                                                url: shoe.imageUrl[1]),
                                          );
                                        });
                                  });
                                }
                              }))),
                    )
                  ],
                )
              ]),
            ),
          )
        ],
      )),
    );
  }

  GestureDetector bottomNavItem(IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
