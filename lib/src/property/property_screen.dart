import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/property/property_detail_screen.dart';
import 'package:property_app/src/property/property_filter_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/widgets/custom_button.dart';

class PropertyScreen extends StatelessWidget {
  static const String routeName = '/property';

  const PropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Property',
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(onTap: () {}, child: const Icon(Icons.map_outlined)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () => Get.toNamed(PropertyFilterScreen.routeName),
              child: Image.asset('assets/icons/filter.png', width: 28.0),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(8.0),
        itemCount: 8,
        itemBuilder: (context, i) {
          return Card(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    // Get.toNamed(RestaurantAttractionDetailScreen.routeName);
                  },
                  child: Stack(
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
                        // items: placeDetail.photos!
                        //     .map(
                        //       (photo) => Container(
                        //         width: MediaQuery.of(context).size.width,
                        //         child: Image.network(
                        //           "${Api.googleAPI}/place/photo?maxwidth=350&photo_reference=${photo.photoReference}&key=${Secret.googleApiKey}",
                        //           fit: BoxFit.cover,
                        //         ),
                        //       ),
                        //     )
                        //     .toList(),
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
                          // Row(
                          //   children: [
                          //     RatingBar.builder(
                          //       initialRating: 0.0,
                          //       itemSize: 18.0,
                          //       minRating: 1,
                          //       direction: Axis.horizontal,
                          //       itemCount: 5,
                          //       ignoreGestures: true,
                          //       itemBuilder: (context, _) => Icon(
                          //         Icons.star,
                          //         color: Colors.amber,
                          //       ),
                          //       onRatingUpdate: (rating) {
                          //         print(rating);
                          //       },
                          //     ),
                          //     const SizedBox(width: 10.0),
                          //     Text('24565'),
                          //   ],
                          // ),
                          const Text('Some text here'),
                          Text('\$420', style: Theme.of(context).textTheme.bodyText1),
                          const Text('Some more details'),
                        ],
                      ),
                      CustomButton(
                        height: 42.0,
                        btnTxt: 'View Details',
                        iconImg: 'assets/icons/forward_arrow.png',
                        onPressed: () => Get.toNamed(PropertyDetailScreen.routeName),
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
