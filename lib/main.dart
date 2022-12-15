import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provydr/const/theme_data.dart';
import 'package:provydr/inner_screens/feeds_screen.dart';
import 'package:provydr/inner_screens/on_sale_screen.dart';
import 'package:provydr/provider/dark_theme_provider.dart';
import 'package:provydr/sample1/app_state.dart';
import 'package:provydr/sample1/my_home_page.dart';
import 'package:provydr/screens/bottom_bar.dart';
import 'package:provydr/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTHeme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAppTHeme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkThemeProvider(),
        )
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: BottomBarScreen(),
          routes: {
            OnSaleScreen.routeName: (context) => const OnSaleScreen(),
            FeedsScreen.routeName: (context) => const FeedsScreen()
          },
        );
      }),
    );
  }
}
