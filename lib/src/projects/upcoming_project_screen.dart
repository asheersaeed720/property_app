import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_button.dart';

class UpcomingProjectScreen extends StatelessWidget {
  static const String routeName = '/upcoming-project';

  const UpcomingProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Upcoming Project',
          style: TextStyle(
            fontFamily: AppTheme.fontName,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: AppTheme.nearBlack,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(8.0),
        itemCount: 8,
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 10,
                    enableInfiniteScroll: false,
                  ),
                  items: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/no_img_available.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/no_img_available.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/no_img_available.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title', style: Theme.of(context).textTheme.headline2),
                          const Text('Some text here'),
                        ],
                      ),
                      CustomButton(
                        height: 42.0,
                        btnTxt: 'View Details',
                        iconImg: 'assets/icons/forward_arrow.png',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
