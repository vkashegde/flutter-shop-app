import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provydr/widgets/on_sale_widget.dart';
import 'package:provydr/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = 'OnSaleScreen';
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isEmpty = false;

    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        title: TextWidget(
            text: 'Products On sale',
            color: color,
            textSize: 22,
            isTitle: true),
      ),
      body: SafeArea(
        child: _isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/box.png',
                      height: 150,
                    ),
                    Text(
                      'No Products On Sale yet! , \n Stay tuned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(12),
                child: GridView.count(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  //crossAxisSpacing: 10,
                  childAspectRatio: size.width / (size.height * 0.6),
                  children: List.generate(16, (index) {
                    return OnSaleWidget();
                  }),
                ),
              ),
      ),
    );
  }
}
