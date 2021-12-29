import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_button.dart';

class UserPropertyScreen extends StatelessWidget {
  static const String routeName = '/user-property';

  const UserPropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'My Properties',
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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 18.0),
        //     child: InkWell(onTap: () {}, child: const Icon(Icons.map_outlined)),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.only(right: 18.0),
        //     child: InkWell(
        //       onTap: () => Get.toNamed(PropertyFilterScreen.routeName),
        //       child: Image.asset('assets/icons/filter.png', width: 28.0),
        //     ),
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              children: [
                Stack(
                  children: [
                    // Image.asset(
                    //   'assets/images/no_img_available.jpg',
                    //   width: double.infinity,
                    //   height: MediaQuery.of(context).size.height / 3.8,
                    //   fit: BoxFit.cover,
                    // ),
                    CarouselSlider(
                      options: CarouselOptions(
                        // autoPlay: true,
                        // autoPlayInterval: const Duration(seconds: 5),
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

                    Positioned(
                      top: 14.0,
                      right: 14.0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(52.0),
                        ),
                        child: const Icon(Icons.favorite_border),
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
                          const Text('Paid'),
                          Text('\$420', style: Theme.of(context).textTheme.bodyText1),
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
