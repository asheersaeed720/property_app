import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/src/auth/auth_controller.dart';
import 'package:property_app/src/property/property_controller.dart';
import 'package:property_app/src/property/property_model.dart';
import 'package:property_app/src/property/views/property_detail_screen.dart';
import 'package:property_app/utils/app_theme.dart';
import 'package:property_app/utils/constants.dart';
import 'package:property_app/widgets/cache_img_widget.dart';
import 'package:property_app/widgets/custom_button.dart';
import 'package:property_app/widgets/properties_placeholder_loading.dart';

class UserPropertyScreen extends StatefulWidget {
  static const String routeName = '/user-property';

  const UserPropertyScreen({Key? key}) : super(key: key);

  @override
  State<UserPropertyScreen> createState() => _UserPropertyScreenState();
}

class _UserPropertyScreenState extends State<UserPropertyScreen> {
  final _propertyController = Get.put(PropertyController());
  final _authController = Get.put(AuthController());

  bool isMapView = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PropertyController>(
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: FutureBuilder<List<PropertyModel>>(
          future:
              _propertyController.getSearchableProperties(_authController.currentUserData['key']),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              List<PropertyModel> propertiesList = snapshot.data ?? [];
              if (propertiesList.isEmpty) {
                return const Center(
                  child: Text('No Properties Available'),
                );
              }
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text(
                      'My Properties',
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: AppTheme.nearBlack,
                      ),
                    ),
                    snap: true,
                    floating: true,
                    elevation: 0,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.black87),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int i) {
                        return Card(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      autoPlayInterval: const Duration(seconds: 5),
                                      viewportFraction: 1.0,
                                      aspectRatio: 16 / 10,
                                      enableInfiniteScroll: false,
                                    ),
                                    items: propertiesList[i].images!.isEmpty
                                        ? [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width,
                                              child: const CacheImgWidget(
                                                "assets/images/no_img_available.jpg",
                                              ),
                                            ),
                                          ]
                                        : propertiesList[i]
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
                                          propertiesList[i].name ?? '',
                                          style: Theme.of(context).textTheme.headline2,
                                        ),
                                        SizedBox(
                                          width: 100.0,
                                          child: Text(
                                            _propertyController.propertiesList[i].description ?? '',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          'PKR ${propertiesList[i].price}',
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                    CustomButton(
                                      height: 42.0,
                                      btnTxt: 'View Details',
                                      iconImg: 'assets/icons/forward_arrow.png',
                                      onPressed: () => Get.toNamed(
                                        PropertyDetailScreen.routeName,
                                        arguments: {
                                          'id': propertiesList[i].id,
                                          'name': propertiesList[i].name,
                                          'description': propertiesList[i].description,
                                          'typeId': propertiesList[i].typeId,
                                          'locationId': propertiesList[i].locationId,
                                          'price': propertiesList[i].price,
                                          'lat': propertiesList[i].lat,
                                          'long': propertiesList[i].long,
                                          'status': propertiesList[i].status,
                                          'createdAt': propertiesList[i].createdAt,
                                          'type': propertiesList[i].type,
                                          'location': propertiesList[i].location,
                                          'images': propertiesList[i].images,
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
                      childCount: propertiesList.length,
                    ),
                  ),
                ],
              );
            }
            return const PropertiesListLoading();
          },
        ),
      ),
    );
  }
}
