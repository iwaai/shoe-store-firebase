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
        padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 20, bottom: 0),
        child: Scaffold(resizeToAvoidBottomInset: false, body: add_body()),
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
  List<String> items = ['Men', 'Woemn', 'Kids'];
  String? selectedItem = 'Men';
  firestoreMethods firestoremethods = firestoreMethods();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final newpriceController = TextEditingController();
  final decriptionController = TextEditingController();
  final imageurlsController = TextEditingController();
  final titleController = TextEditingController();
  String categorysupplier = 'Men';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: EdgeInsets.only(top: 9.h),
          child: Column(children: [
            productNameField(),
            const SizedBox(
              height: 29,
            ),
            categorydropdown(),
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
            signInButtton()
          ]),
        ),
      ),
    );
  }

  Container categorydropdown() {
    return Container(
      width: 350.w,
      padding: const EdgeInsets.only(left: 42, right: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kTextColor)),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        isExpanded: true,
        items: items.map<DropdownMenuItem<String>>((String pvalue) {
          return DropdownMenuItem<String>(
            value: pvalue,
            child: Text(
              pvalue,
              style: textTheme.bodyMedium!.copyWith(
                fontSize: 14.sp,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue!;
            categorysupplier = newValue;
          });
        },
      ),
    );
  }

  InkWell signInButtton() {
    return InkWell(
        onTap: () async {
          List<String> stringList = imageurlsController.text.split(',');
          List<String> newli = List<String>.from(stringList.map((x) => x));
          firestoremethods.uploadProducttodb(
              pname: nameController.text,
              pcategory: decriptionController.text,
              pimageurls: newli,
              poldPrice: priceController.text,
              psizes: [
                Size(size: '6.8', isSelected: false),
                Size(size: '6.9', isSelected: false)
              ],
              pnewprce: "79.00",
              pdescription: decriptionController.text,
              ptitle: titleController.text);
          print(nameController.text);
          print(categorysupplier);

          print(newli);
          print(priceController.text);
          print(newpriceController.text);
          print(decriptionController.text);
          print(titleController.text);
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
        labelText: "Product Name",
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
        hintText: 'Enter image urls COMMA (,) seperated',
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
        hintText: 'Enter price',
        labelText: "Original Price",
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
      controller: newpriceController,
      decoration: InputDecoration(
        hintText: 'Enter discounted price',
        labelText: "New Price",
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
        labelText: " Description",
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
