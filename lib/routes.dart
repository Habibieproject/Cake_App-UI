
import 'package:cake_app/screens/listview_image/listview_screen.dart';
import 'package:cake_app/screens/register_succes/login_success_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:cake_app/screens/home/home_screen.dart';
import 'package:cake_app/screens/login_success/login_success_screen.dart';
import 'package:cake_app/screens/sign_in/sign_in_screen.dart';
import 'package:cake_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  RegisterSuccessScreen.routeName: (context) => RegisterSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ListView_Image.routeName: (context) => ListView_Image(),

};
