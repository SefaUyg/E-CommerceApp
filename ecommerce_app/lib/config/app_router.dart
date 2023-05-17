import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:ecommerce_app/screens/login/login_screen.dart';
import 'package:ecommerce_app/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');

    switch (settings.name){
    case '/':
      return HomeScreen.route();
    case HomeScreen.routeName:
      return HomeScreen.route();
    case SplashScreen.routeName:
      return SplashScreen.route();
    case ProfileScreen.routeName:
      return ProfileScreen.route();
    case LoginScreen.routeName:
      return LoginScreen.route();
    case SignupScreen.routeName:
      return SignupScreen.route();
    case CartScreen.routeName:
      return CartScreen.route();
    case ProductScreen.routeName:
      return ProductScreen.route(product: settings.arguments as Product);
    case WishlistScreen.routeName:
      return WishlistScreen.route();
    case CatalogScreen.routeName:
      return CatalogScreen.route(category: settings.arguments as Category);
    case CheckoutScreen.routeName:
      return CheckoutScreen.route();
    case OrderConfirmation.routeName:
      return OrderConfirmation.route();
    
    default:
      return _errorRoute();
    }
  }
  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(appBar: AppBar(title: Text('Error')),),
    );
  }
}