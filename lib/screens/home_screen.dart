import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provydr/provider/dark_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context, listen: false);
    return Scaffold(
      body: Center(
          child: SwitchListTile(
              title: Text('Switch'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: themeState.getDarkTheme,
              onChanged: (bool val) {
                themeState.setDarkTheme = val;
              })),
    );
  }
}
