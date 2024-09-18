import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/routers/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: appRouter,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ur', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: lightTheme,
    );
  }
}

const primaryColor = Color(0xFF00BF6D);
const onPrimaryColor = Colors.white;
const secondaryColor = Color.fromARGB(255, 171, 247, 214);
const onSecondaryColor = Colors.black;
const errorColor = Colors.red;
const onErrorColor = Colors.white;
const surfaceColor = greyColor;
const onsurfaceColor = Colors.black;
const fillColor = Color.fromARGB(255, 241, 253, 248);
const greyColor = Color.fromARGB(255, 234, 234, 234);

OutlineInputBorder _getBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  );
}

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    error: errorColor,
    onError: onErrorColor,
    surface: surfaceColor,
    onSurface: onsurfaceColor,
  ),
  scaffoldBackgroundColor: onPrimaryColor,
  // [Elevated Button Theme]
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
      backgroundColor: const WidgetStatePropertyAll(primaryColor),
      foregroundColor: const WidgetStatePropertyAll(onPrimaryColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  ),

  // [Text Button Theme]
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          WidgetStatePropertyAll(onSecondaryColor.withOpacity(0.5)),
    ),
  ),

  // [Text Field Theme]
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: fillColor,
    border: _getBorder(greyColor),
    enabledBorder: _getBorder(greyColor),
    focusedBorder: _getBorder(primaryColor),
    errorBorder: _getBorder(errorColor),
    focusColor: primaryColor,
    hoverColor: primaryColor.withOpacity(0.1),
    focusedErrorBorder: _getBorder(errorColor),
  ),

  // [Card Theme]
  cardTheme: const CardTheme(color: onPrimaryColor),
);
