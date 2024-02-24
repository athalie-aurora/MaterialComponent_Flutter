import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart'; // Import CutCornersBorder
import 'backdrop.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
          currentCategory: Category.all,
          frontLayer: HomePage(),
          backLayer: Container(color: kShrinePink100),
          frontTitle: Text('SHRINE'),
          backTitle: Text('MENU'),
        ),
      },
      theme: _buildShrineTheme(),
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePurple,
        secondary: kShrinePurple,
        error: kShrineErrorRed,
      ),
      scaffoldBackgroundColor: kShrineSurfaceWhite,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePurple,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: kShrineBrown900,
        backgroundColor: kShrineBlue100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: CutCornersBorder(),
        focusedBorder: CutCornersBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrinePurple,
          ),
        ),
        floatingLabelStyle: TextStyle(
          color: kShrinePurple,
        ),
      ),
    );
  }
}
