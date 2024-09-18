import 'package:flutter/material.dart';

import 'package:food_delivery_app/src/common/app_sizes.dart';
import 'package:food_delivery_app/src/common/breakpoints.dart';
import 'package:food_delivery_app/src/common/responsive_center.dart';
import 'package:food_delivery_app/src/common/responsive_scrollable_card.dart';
import 'package:food_delivery_app/src/features/auth/presentation/widgets/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // [Layout For Laptops & Tablets]
            if (constraints.maxWidth > Breakpoint.tablet) {
              return Center(
                child: ResponsiveScrollableCard(
                  child: LoginContent(constraints: constraints),
                ),
              );
            }
            // [Layout for mobile phones]
            return ResponsiveCenter(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                child: LoginContent(constraints: constraints),
              ),
            );
          },
        ),
      ),
    );
  }
}
