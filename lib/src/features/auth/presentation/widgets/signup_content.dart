import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_delivery_app/src/routers/router.dart';
import 'package:food_delivery_app/src/common/app_sizes.dart';
import 'package:food_delivery_app/src/utils/validators.dart';
import 'package:food_delivery_app/src/common/custom_textfield.dart';
import 'package:food_delivery_app/src/utils/localization_extension.dart';
import 'package:food_delivery_app/src/features/auth/presentation/widgets/toggle_button.dart';
import 'package:food_delivery_app/src/features/auth/presentation/widgets/logo_headline_section.dart';

class SignupContent extends StatefulWidget {
  const SignupContent({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<SignupContent> createState() => _SignupContentState();
}

class _SignupContentState extends State<SignupContent> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _pswController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cnfrmPswController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateState);
    _emailController.addListener(_updateState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateState);
    _emailController.removeListener(_updateState);
    _pswController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _cnfrmPswController.dispose();
    super.dispose();
  }

  // [Contains All TextFields]
  Column _buildTextFormFields() {
    return Column(
      children: [
        CustomTextFormField(
          controller: _nameController,
          keyboardType: TextInputType.name,
          hintText: context.loc.fullName,
          onIconTap: () => _nameController.clear(),
          validator: (val) => Validators.validateName(val, context),
          icon: _nameController.text.isNotEmpty ? Icons.close : null,
        ),
        gapH16,
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
        CustomTextFormField(
          obscureText: _obscureText,
          controller: _cnfrmPswController,
          hintText: context.loc.confirmPassword,
          onIconTap: () => setState(() => _obscureText = !_obscureText),
          icon: _obscureText ? Icons.visibility_off : Icons.visibility,
          validator: (val) => Validators.validateConfirmPassword(
              val, _cnfrmPswController.text, context),
        ),
        gapH16,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoAndHeadlineSection(constraints: widget.constraints, isLogin: false),
        Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextFormFields(),
              ElevatedButton(
                onPressed: _signUp,
                child: Text(context.loc.signUp),
              ),
              gapH8,
              CustomToggleButton(
                onPressed: _toggle,
                firstText: context.loc.alreadyHaveAccount,
                secondText: context.loc.login,
              )
            ],
          ),
        ),
      ],
    );
  }

  void _updateState() => setState(() {});

  void _toggle() => context.goNamed(AppRoutes.login.name);

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      throw ('Form is valid and ready to submit');
    }
  }
}
