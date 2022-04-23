import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin KgpUiLight {
  static final ThemeData theme = _lightTheme();
  static const Color _primaryColor = Colors.green;
  static const Color _backgroundColor = Color.fromRGBO(236, 240, 241, 1.0);
  static const Color _textColor = Color.fromRGBO(107, 124, 147, 1.0);

  static ThemeData _lightTheme() {
    const TextTheme textTheme = TextTheme(
      subtitle1: TextStyle(color: _textColor),
      subtitle2: TextStyle(color: _textColor),
      headline1: TextStyle(color: _textColor),
      headline2: TextStyle(color: _textColor),
      headline3: TextStyle(color: _textColor),
      headline4: TextStyle(color: _textColor),
      headline5: TextStyle(color: _textColor),
      headline6: TextStyle(color: _textColor),
      bodyText1: TextStyle(color: _textColor),
      bodyText2: TextStyle(color: _textColor),
      caption: TextStyle(color: _textColor),
      overline: TextStyle(color: _textColor),
    );

    const IconThemeData iconTheme = IconThemeData(
      color: _textColor,
    );

    final AppBarTheme appBarTheme = AppBarTheme(
      color: _backgroundColor,
      elevation: 0,
      actionsIconTheme: iconTheme,
      iconTheme: iconTheme,
      toolbarTextStyle: textTheme.bodyText2,
      titleTextStyle: textTheme.headline6,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );

    const FloatingActionButtonThemeData floatingActionButtonTheme =
        FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      elevation: 5.0,
    );

    final CardTheme cardTheme = CardTheme(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

    return ThemeData(
      primaryColor: _primaryColor,
      primaryColorLight: _textColor,
      textTheme: textTheme,
      scaffoldBackgroundColor: _backgroundColor,
      hintColor: _textColor,
      appBarTheme: appBarTheme,
      iconTheme: iconTheme,
      primaryIconTheme: iconTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      canvasColor: _backgroundColor,
      brightness: Brightness.light,
      backgroundColor: _backgroundColor,
      cardTheme: cardTheme,
      inputDecorationTheme: const InputDecorationTheme(
        prefixStyle: TextStyle(
          color: _textColor,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: _backgroundColor,
      ),
      primaryTextTheme: textTheme,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(_textColor),
          visualDensity: VisualDensity.compact,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(_primaryColor),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _primaryColor),
    );
  }
}
