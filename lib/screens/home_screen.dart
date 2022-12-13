import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:provydr/inner_screens/on_sale_screen.dart';
import 'package:provydr/provider/dark_theme_provider.dart';
import 'package:provydr/services/utils.dart';
import 'package:provydr/widgets/feeds_items.dart';
import 'package:provydr/widgets/on_sale_widget.dart';
import 'package:provydr/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final List<String> _offerImages = [
    'assets/images/offres/Offer1.jpg',
    'assets/images/offres/Offer2.jpg',
    'assets/images/offres/Offer3.jpg',
    'assets/images/offres/Offer4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.33,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      _offerImages[index],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: _offerImages.length,
                  autoplay: true,
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white, activeColor: Colors.red)),
                  //control: SwiperControl(),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (index) => OnSaleScreen()));

                    Navigator.pushNamed(context, OnSaleScreen.routeName);
                  },
                  child: TextWidget(
                      text: 'View All', color: Colors.blue, textSize: 20)),
              SizedBox(
                height: size.height * 0.24,
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: Row(
                        children: [
                          TextWidget(
                            text: 'ON SALE',
                            color: Colors.red,
                            textSize: 22,
                            isTitle: true,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            IconlyLight.discount,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: SizedBox(
                        child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return OnSaleWidget();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Our Products',
                      color: color,
                      textSize: 20,
                      isTitle: true,
                    ),
                    //const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: TextWidget(
                            text: 'Browse All',
                            color: Colors.blue,
                            textSize: 20)),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.6),
                children: List.generate(4, (index) {
                  return Feeds();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
