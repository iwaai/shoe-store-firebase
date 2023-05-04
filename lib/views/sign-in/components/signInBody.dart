// packages
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../models/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// controllers
import '../../../controllers/providers/errorProvider.dart';
import '../../../controllers/providers/radioCheckProvider.dart';
import '../../../controllers/providers/CircleIndicatorProvider.dart';
import '../../../controllers/authentication/authentication.dart';
// screens
import '../../signup/signUpScreen.dart';
import '../../forgotpass/forgotPassScreen.dart';

class signInBody extends StatelessWidget {
  const signInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(children: [
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Welcome Back",
              style: textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 38.sp,
              ),
            ),
            Text(
              "Sign in with your email and password\n or continue with social media",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(),
            ),
            SizedBox(
              height: 40.h,
            ),
            SignForm()
          ]),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _auth = authenticationMethods();
  //final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        emailTextField(),
        const SizedBox(
          height: 29,
        ),
        passwordTextField(),
        SizedBox(
          height: 5.h,
        ),
        Consumer<errorProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
                children: List.generate(
              Provider.of<errorProvider>(context, listen: false).errors.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Icon(
                      Iconsax.danger,
                      color: Colors.red,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      value.errors[index],
                      style: textTheme.headlineMedium!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.red),
                    )
                  ],
                ),
              ),
            ));
          },
        ),
        SizedBox(
          height: 7.h,
        ),
        Row(
          children: [
            Consumer<radioCheckProvider>(
                builder: (BuildContext context, val, Widget? child) {
              return Checkbox(
                  value: Provider.of<radioCheckProvider>(context, listen: false)
                      .remember,
                  onChanged: (value) {
                    Provider.of<radioCheckProvider>(context)
                        .rememberAlt(value!);
                  });
            }),
            const Text('Remember me'),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, forgotPassScreen.routeName);
              },
              child: const Text("Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline)),
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        signInButtton(),
        SizedBox(
          height: 17.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            diffLogin('assets/icons/facebook.png'),
            diffLogin('assets/icons/google.png'),
            diffLogin('assets/icons/twitter.png'),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(fontSize: 13.sp),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, signUpScreen.routeName);
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 14.sp, color: kbuttonColor),
              ),
            )
          ],
        )
      ]),
    );
  }

  GestureDetector diffLogin(String image) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 6.w),
        padding: EdgeInsets.all(10.sp),
        height: 80.h,
        width: 50.w,
        decoration: const BoxDecoration(
          color: Color(0xfff5fff9),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          image,
          height: 355.h,
          width: 325.w,
        ),
      ),
    );
  }

  InkWell signInButtton() {
    return InkWell(
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            await _auth.SignIn(
                email: emailController.text.toString(),
                password: passwordController.text.toString(),
                ctx: context);
          }
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

  TextFormField passwordTextField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: "Password",
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
          suffixIcon: const Icon(Iconsax.password_check)),
      validator: (value) {
        if (value!.isEmpty &&
            !Provider.of<errorProvider>(context, listen: false)
                .errors
                .contains('Enter password')) {
          Provider.of<errorProvider>(context, listen: false)
              .addError('Enter password');
        }
        return null;
      },
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: "Email",
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
        suffixIcon: const Icon(Icons.email_outlined),
      ),
      validator: (value) {
        if (value!.isEmpty &&
            !Provider.of<errorProvider>(context, listen: false)
                .errors
                .contains('Enter email')) {
          Provider.of<errorProvider>(context, listen: false)
              .addError('Enter email');
        }
        return null;
      },
    );
  }
}
