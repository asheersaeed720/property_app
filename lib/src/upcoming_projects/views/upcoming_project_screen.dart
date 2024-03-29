import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/upcoming_projects/project_controller.dart';
import 'package:property_app/src/upcoming_projects/upcoming_project.dart';
import 'package:property_app/src/upcoming_projects/views/upcoming_project_detail_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/constants.dart';
import 'package:property_app/widgets/cache_img_widget.dart';
import 'package:property_app/widgets/custom_button.dart';
import 'package:property_app/widgets/loading_widget.dart';

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
      body: GetBuilder<ProjectController>(
        init: ProjectController(),
        builder: (propertyController) => FutureBuilder<List<UpcomingProjectModel>>(
          future: propertyController.getAllProjects(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UpcomingProjectModel> upcomingProjectsList = snapshot.data ?? [];
              return ListView.builder(
                // padding: const EdgeInsets.all(8.0),
                itemCount: upcomingProjectsList.length,
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
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  viewportFraction: 1.0,
                                  aspectRatio: 16 / 10,
                                  enableInfiniteScroll: false,
                                ),
                                items: upcomingProjectsList[i].images!.isEmpty
                                    ? [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          child: const CacheImgWidget(
                                            "assets/images/no_img_available.jpg",
                                          ),
                                        ),
                                      ]
                                    : upcomingProjectsList[i]
                                        .images!
                                        .map(
                                          (e) => SizedBox(
                                            width: MediaQuery.of(context).size.width,
                                            child: CacheImgWidget(
                                              "$imgURL/${e.image}",
                                            ),
                                          ),
                                        )
                                        .toList(),
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
                                  Text(
                                    upcomingProjectsList[i].name ?? '',
                                    style: Theme.of(context).textTheme.headline2,
                                  ),
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
                                  SizedBox(
                                    width: 100.0,
                                    child: Text(
                                      upcomingProjectsList[i].description ?? '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Text(
                                  //   'PKR ${upcomingProjectsList[i].price}',
                                  //   style: Theme.of(context).textTheme.bodyText1,
                                  // ),
                                  // const Text('Some more details'),
                                ],
                              ),
                              CustomButton(
                                height: 42.0,
                                btnTxt: 'View Details',
                                iconImg: 'assets/icons/forward_arrow.png',
                                // onPressed: () {},
                                onPressed: () => Get.toNamed(
                                  UpcomingProjectDetailScreen.routeName,
                                  arguments: {
                                    'id': upcomingProjectsList[i].id,
                                    'name': upcomingProjectsList[i].name,
                                    'description': upcomingProjectsList[i].description,
                                    // 'typeId': upcomingProjectsList[i].typeId,
                                    'locationId': upcomingProjectsList[i].locationId,
                                    // 'price': upcomingProjectsList[i].price,
                                    // 'lat': upcomingProjectsList[i].lat,
                                    // 'long': upcomingProjectsList[i].long,
                                    // 'status': upcomingProjectsList[i].status,
                                    'createdAt': upcomingProjectsList[i].createdAt,
                                    // 'type': upcomingProjectsList[i].type,
                                    // 'location': upcomingProjectsList[i].location,
                                    'images': upcomingProjectsList[i].images,
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              // log((snapshot.error as Error).stackTrace.toString());
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
