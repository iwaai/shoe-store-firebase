//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// controllers
//screens
import './views/splash/splashScreen.dart';
import './views/sign-in/signInScreen.dart';
import './views/signup/signUpScreen.dart';
import './views/add/addScreen.dart';
//providers
import 'controllers/providers/pageswitch.dart';
import 'controllers/providers/dotChanger.dart';
import 'controllers/providers/CircleIndicatorProvider.dart';
import 'controllers/providers/errorProvider.dart';
import 'controllers/providers/radioCheckProvider.dart';
import 'models/ShoeProvider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => pageswitch()),
              ChangeNotifierProvider(create: (_) => dotChanger()),
              ChangeNotifierProvider(create: (_) => errorProvider()),
              ChangeNotifierProvider(create: (_) => radioCheckProvider()),
              ChangeNotifierProvider(create: (_) => circleIndicatorProvider()),
              ChangeNotifierProvider(create: (_) => ShoeMaleProvider())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme:
                    const AppBarTheme(color: Colors.transparent, elevation: 0),
                brightness: Brightness.light,
                scaffoldBackgroundColor: Colors.white,
              ),
              home: splashScreen(),
              routes: {
                signInScreen.routeName: (context) => const signInScreen(),
                signUpScreen.routeName: (context) => const signUpScreen(),
                addScreen.routeName: (context) => const addScreen()
              },
            ),
          );
        });
  }
}
