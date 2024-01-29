import 'package:flutter/material.dart';
import 'package:neelkanth/framework/utility/session.dart';

class AppColors {
  AppColors._();

  static bool isDarkMode = (Session.getIsAppThemeDark() ?? false);
  static const Color shimmerEffect = Color(0xFFDFDFDF);

  static const Color primary = Color(0xFFADD8E6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1C2121);
  static const Color clrBCBCBC = Color(0xFFBCBCBC);
  static const Color black000000 = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
  static const Color placeholder = Color(0xFFC1C1C1); //image placeholder
  static const Color greyLight = Color(0xFFD2D2D2);
  static const Color grey979797 = Color(0xFF979797);
  static const Color splashBlue = Color(0xFF183696);
  static const Color blue = Color(0xFF0D75F8);
  static const Color blueADD8E6 = Color(0xFFADD8E6);
  static const Color blue75F81A = Color(0x1A0D75F8);
  static const Color blueE9F9FF = Color(0xFFE9F9FF);
  static const Color red = Color(0xFFFF3B3B);
  static const Color redFF0000 = Color(0xFFFF0000);
  static const Color green = Color(0xFF007700);
  static const Color greenD2FFD2 = Color(0xFFD2FFD2);
  static const Color green008858 = Color(0xFF008858);
  static const Color yellow = Color(0xFFD4AF37);
  static const Color yellowEBE7D9 = Color(0xFFEBE7D9);
  static const Color yellowFDEAA0 = Color(0xFFFDEAA0);
  static const Color yellowFFAB11 = Color(0xFFFFAB11);
  static const Color yellowFFF7DE = Color(0xFFFFF7DE);
  static const Color purple = Color(0xFF9747CC);
  static const Color shadowLight = Color(0xFF00001A);
  static const Color purpleF5E6FF = Color(0xFFF5E6FF);
  static const Color pink = Color(0xFFF80DD1);
  static const Color pinkFFE4FA = Color(0xFFFFE4FA);
  static const Color darkGrey = Color(0xFF808080);
  static const Color textGrey = Color(0xFF9F9F9F);
  static const Color clrC4E2ED = Color(0xFFC4E2ED);
  static const Color clrF6F5F5 = Color(0xFFf6f5f5);
  static const Color clr707070 = Color(0xFF707070);
  static const Color clr8E8E8E = Color(0xFF8E8E8E);
  static const Color greySearchBarBg = Color(0xFFF5F5F5);
  static const Color black070707 = Color(0xFF070707);
  static const Color black1B1B1B = Color(0xFF1B1B1B);
  static const Color blue21A5D2 = Color(0xFF21A5D2);
  static const Color blueEBF0F3 = Color(0xFFEBF0F3);
  static const Color blueF7FBFD = Color(0xFFF7FBFD);
  static const Color greyF8F8F8 = Color(0xFFF8F8F8);
  static const Color black616161 = Color(0xFF616161);

  static const Color grey9F9F9F = Color(0xFF9F9F9F);
  static const Color greyAAAAAA = Color(0xFFAAAAAA);
  static const Color greyB5B5B5 = Color(0xFFB5B5B5);
  static const Color greyEEEEEE = Color(0xFFEEEEEE);
  static const Color greyF7F7FA = Color(0xFFF7F7FA);
  static const Color grey808080 = Color(0xFF808080);
  static const Color greyE9E9E9 = Color(0xFFE9E9E9);
  static const Color greyBCBCBC = Color(0xFFBCBCBC);

  static MaterialColor materialColorPrimary = MaterialColor(0xFFADD8E6, colorSwathes);

  static Map<int, Color> colorSwathes = {
    50: const Color.fromRGBO(173, 216, 230, .1),
    100: const Color.fromRGBO(173, 216, 230, .2),
    200: const Color.fromRGBO(173, 216, 230, .3),
    300: const Color.fromRGBO(173, 216, 230, .4),
    400: const Color.fromRGBO(173, 216, 230, .5),
    500: const Color.fromRGBO(173, 216, 230, .6),
    600: const Color.fromRGBO(173, 216, 230, .7),
    700: const Color.fromRGBO(173, 216, 230, .8),
    800: const Color.fromRGBO(173, 216, 230, .9),
    900: const Color.fromRGBO(173, 216, 230, 1),
  };

  static Color textByTheme() => isDarkMode ? white : primary;

  static Color textByLightPrimary() => isDarkMode ? green : primary;

  static Color textGreyByTheme() => isDarkMode ? white : white;

  static Color searchFontByTheme() => isDarkMode ? primary : white;

  static Color buttonBGGreyByTheme() => isDarkMode ? primary : white;

  static Color imageColorByTheme() => isDarkMode ? primary : white;

  static Color drawerBgByTheme() => isDarkMode ? black : white;

  static Color textMainFontByTheme() => isDarkMode ? white : black;

  static Color whiteBlackByTheme() => isDarkMode ? white : black;

  static Color textLightGreyByTheme() => isDarkMode ? white : black;

  static Color darkByScaffoldTheme() => isDarkMode ? black : white;

  static Color scaffoldBGByTheme() => isDarkMode ? black : white;

  static Color greyScaffoldBGByTheme() => isDarkMode ? black : darkGrey;

  static Color textDarkGreyByTheme() => isDarkMode ? black : primary;

  static Color cardBGByTheme() => isDarkMode ? black : white;

  static Color buttonFGByTheme(bool isOn) => isOn
      ? white
      : isDarkMode
          ? white
          : primary;

  static Color buttonBGByTheme(bool isOn) => isOn
      ? isDarkMode
          ? primary
          : white
      : isDarkMode
          ? primary
          : black;

  static Color buttonBorderByTheme() => isDarkMode ? white : primary;

  static Color dividerByTheme() => isDarkMode ? white : black;

  static Color dialogBGByTheme() => isDarkMode ? white : black;

  static Color textFieldTextByTheme() => isDarkMode ? primary : black;

  static Color textFieldBorderColorByTheme() => isDarkMode ? primary : black;

  static Color textFieldDisableBorderColorByTheme() =>
      isDarkMode ? white : transparent;

  static Color suggestionTextByTheme() => isDarkMode ? primary : darkGrey;

  static Color whiteBlackNewByTheme() => isDarkMode ? white : darkGrey;

  static Color blackWhiteByTheme() => isDarkMode ? white : black;

  static Color blackNewLightPurpleByTheme() => isDarkMode ? black : primary;

  static Color darkPurpleWhiteByTheme() => isDarkMode ? white : primary;

  static Color primaryWhiteByTheme() => isDarkMode ? white : primary;

  static Color whiteGreyNewByTheme() => isDarkMode ? white : black;

  static Color greyTransparentByTheme() => isDarkMode ? transparent : darkGrey;

  static Color greyNewWhiteByTheme() => isDarkMode ? white : darkGrey;

  static Color darkGreyByTheme() => isDarkMode ? black : white;

  static Color lightGreyByTheme() => isDarkMode ? white : black;

  static Color textWhiteByNewBlack() => isDarkMode ? white : black;

  static Color textWhiteByNewBlack2() => isDarkMode ? white : black;

  static Color cardBGDarkGrey() => isDarkMode ? black : greyLight;

  static Color textByLightGreen() => isDarkMode ? white : green;

// static Color textByTheme() => isDarkMode ? white : primary;
}
