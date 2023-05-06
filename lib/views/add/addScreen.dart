// packages
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../controllers/firestore/firestoreMethods.dart';
import '../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/providers/CircleIndicatorProvider.dart';
import '../../models/maleShoe.dart';
// controllers

// screens

class addScreen extends StatelessWidget {
  static const routeName = '/add-screen';
  const addScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 40, bottom: 0),
        child: Scaffold(
            resizeToAvoidBottomInset: false, body: SizedBox(child: add_body())),
      ),
    );
  }
}

class add_body extends StatefulWidget {
  const add_body({super.key});

  @override
  State<add_body> createState() => _add_bodyState();
}

class _add_bodyState extends State<add_body> {
  firestoreMethods firestoremethods = firestoreMethods();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final newpriceController = TextEditingController();
  final decriptionController = TextEditingController();
  final imageurlsController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(children: [
          productNameField(),
          const SizedBox(
            height: 29,
          ),
          catergyfield(),
          const SizedBox(
            height: 29,
          ),
          imageurlsfield(),
          const SizedBox(
            height: 29,
          ),
          oldpricefield(),
          const SizedBox(
            height: 29,
          ),
          pricefield(),
          const SizedBox(
            height: 29,
          ),
          descrptionField(),
          const SizedBox(
            height: 29,
          ),
          titleField(),
          const SizedBox(
            height: 29,
          ),
          productNameField(),
          const SizedBox(
            height: 29,
          ),
          signInButtton()
        ]),
      ),
    );
  }

  InkWell signInButtton() {
    return InkWell(
        onTap: () async {
          firestoremethods.uploadProducttodb(
              pname: 'UltraBoost Shoes',
              pcategory: 'Men\'s Running',
              pimageurls: [
                "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
                "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
              ],
              poldPrice: "1899.00",
              psizes: [
                Size(size: '6.8', isSelected: false),
                Size(size: '6.9', isSelected: false)
              ],
              pnewprce: "79.00",
              pdescription:
                  "Put some pep in your step with the adidas Originals NMD R1.V2. The modern silhouette teams up with retro details to create a truly stand-out look. Your new favorite sneakers are right here. Regular fit shows off a streamlined silhouette Classic lace closure lets you adjust for your ideal fit.Textile upper provides a snug comfortable feel. Responsive Boost midsole includes plugs for throwback style",
              ptitle: "Adidas Running Shoes With Cooling Ventilations");
        },
        child: Container(
          height: 60.sp,
          width: 310.sp,
          decoration: BoxDecoration(
              color: kbuttonColor, borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Consumer<circleIndicatorProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return value.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text('Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp));
              },
            ),
          ),
        ));
  }

  TextFormField productNameField() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Enter Product Name',
        labelText: "Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField catergyfield() {
    return TextFormField(
      controller: categoryController,
      decoration: InputDecoration(
        hintText: 'Enter category Name',
        labelText: "category",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField imageurlsfield() {
    return TextFormField(
      controller: imageurlsController,
      decoration: InputDecoration(
        hintText: 'Enter image urls',
        labelText: "image urls",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField oldpricefield() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(
        hintText: 'Enter old price',
        labelText: "old price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField pricefield() {
    return TextFormField(
      controller: priceController,
      decoration: InputDecoration(
        hintText: 'Enter new price',
        labelText: "new price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField descrptionField() {
    return TextFormField(
      controller: decriptionController,
      decoration: InputDecoration(
        hintText: 'Enter description',
        labelText: " descriptoin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }

  TextFormField titleField() {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: 'Enter title',
        labelText: "title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10),
        suffixIcon: const Icon(Icons.nat_outlined),
      ),
    );
  }
}
