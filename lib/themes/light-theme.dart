import 'package:flutter/material.dart';

class KgpUiLight {
  final Color primaryColor;

  KgpUiLight({
    this.primaryColor,
  });

  static final ThemeData theme = _lightTheme();
  static final Color _primaryColor = Colors.green;
  static final Color _backgroundColor =
      const Color.fromRGBO(236, 240, 241, 1.0);
  static final Color _textColor = const Color.fromRGBO(107, 124, 147, 1.0);

  static ThemeData _lightTheme() {
    TextTheme textTheme = TextTheme(
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

    IconThemeData iconTheme = IconThemeData(
      color: _textColor,
    );

    AppBarTheme appBarTheme = AppBarTheme(
      brightness: Brightness.light,
      color: _backgroundColor,
      elevation: 0,
      textTheme: textTheme,
      actionsIconTheme: iconTheme,
      iconTheme: iconTheme,
    );

    FloatingActionButtonThemeData floatingActionButtonTheme =
        FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      elevation: 5.0,
    );

    CardTheme cardTheme = CardTheme(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

    return ThemeData(
      primaryColor: _primaryColor,
      primaryColorLight: _textColor,
      primaryColorBrightness: Brightness.light,
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
      accentColor: _primaryColor,
      inputDecorationTheme: InputDecorationTheme(
        prefixStyle: TextStyle(
          color: _textColor,
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
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
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(_primaryColor),
        ),
      ),
    );
  }
}
