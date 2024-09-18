import 'package:go_router/go_router.dart';
import 'package:food_delivery_app/src/features/auth/presentation/screens/login_screen.dart';
import 'package:food_delivery_app/src/features/auth/presentation/screens/signup_screen.dart';

enum AppRoutes { login, signup }

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: AppRoutes.signup.name,
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
