import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provydr/widgets/text_widget.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  final String catText, imgPath;
  final Color gridColor;
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.gridColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    double _screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        print('lololo');
      },
      child: Container(
        decoration: BoxDecoration(
            color: gridColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: gridColor.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill)),
            ),
            TextWidget(
              text: catText,
              color: color,
              textSize: 20,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
