import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_delivery_app/src/routers/router.dart';
import 'package:food_delivery_app/src/utils/validators.dart';
import 'package:food_delivery_app/src/common/app_sizes.dart';
import 'package:food_delivery_app/src/common/custom_textfield.dart';
import 'package:food_delivery_app/src/utils/localization_extension.dart';
import 'package:food_delivery_app/src/features/auth/presentation/widgets/toggle_button.dart';
import 'package:food_delivery_app/src/features/auth/presentation/widgets/logo_headline_section.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _pswController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateState);
    _pswController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // [Contains All TextFields]
  Column _buildTextFormFields() {
    return Column(
      children: [
        CustomTextFormField(
          hintText: context.loc.email,
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          onIconTap: () => _emailController.clear(),
          validator: (val) => Validators.validateEmail(val, context),
          icon: _emailController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH16,
        CustomTextFormField(
          obscureText: _obscureText,
          controller: _pswController,
          hintText: context.loc.password,
          onIconTap: () => setState(() => _obscureText = !_obscureText),
          validator: (val) => Validators.validatePassword(val, context),
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
        ),
        gapH16,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoAndHeadlineSection(constraints: widget.constraints),
        Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextFormFields(),
              ElevatedButton(
                onPressed: _logIn,
                child: Text(context.loc.login),
              ),
              gapH8,
              TextButton(
                onPressed: _forgotPassword,
                child: Text(context.loc.forgotPassword),
              ),
              gapH8,
              CustomToggleButton(
                onPressed: _toggle,
                firstText: context.loc.dontHaveAccount,
                secondText: context.loc.signUp,
              )
            ],
          ),
        ),
      ],
    );
  }

  void _forgotPassword() {}

  void _updateState() => setState(() {});

  void _toggle() => context.goNamed(AppRoutes.signup.name);

  void _logIn() {
    if (_formKey.currentState!.validate()) {
      throw ('Form is valid and ready to submit');
    }
  }
}
