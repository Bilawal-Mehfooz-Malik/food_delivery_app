import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/utils/localization_extension.dart';

class LogoAndHeadlineSection extends StatelessWidget {
  const LogoAndHeadlineSection(
      {super.key, required this.constraints, this.isLogin = true});

  final bool isLogin;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(height: constraints.maxHeight * 0.02),

        // conditionally show logo on login and hide on signup screen
        if (isLogin) ...[
          Image.network(
              height: 100, "https://i.postimg.cc/nz0YBQcH/Logo-light.png"),
          SizedBox(height: constraints.maxHeight * 0.06),
        ],

        // Headline
        Text(
          isLogin ? context.loc.login : context.loc.signUp,
          style: theme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: constraints.maxHeight * 0.05),
      ],
    );
  }
}
