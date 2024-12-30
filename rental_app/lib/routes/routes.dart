import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/features/home/view/home_screen.dart';
import 'package:rental_app/features/splash/view/splash_screen.dart';
import 'package:rental_app/features/addCar/view/add_car_screen.dart';
import 'package:rental_app/features/bookings/view/bookings_screen.dart';
import 'package:rental_app/features/login/view/login_screen.dart';
import 'package:rental_app/features/signup/view/sign_up_screen.dart';
import 'package:rental_app/features/profile/view/profile_screen.dart';
import 'package:rental_app/features/car_details/view/cars_screen.dart';
import 'package:rental_app/routes/routes_constanta.dart';
import 'package:rental_app/features/favourite/view/favourite_screen.dart';

class AppRouter
{
static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
static final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
      initialLocation: RoutesConstants.loginScreen,
  routes: <RouteBase>[
    GoRoute(
      path: RoutesConstants.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.loginScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.signUpScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RoutesConstants.carDetailsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const CarsScreen();
      },
    ),
    GoRoute(
        path: RoutesConstants.bookingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const BookingsScreen();
        }),
    GoRoute(
        path: RoutesConstants.favoriteScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const FavouriteScreen();
        }),
    GoRoute(
        path: RoutesConstants.addCar,
        builder: (BuildContext context, GoRouterState state) {
          return const AddCarScreen();
        }),
    GoRoute(
        path: RoutesConstants.profileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        })
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
);
}